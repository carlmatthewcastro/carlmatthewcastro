param(
    [string]$SourceDirectory = (Join-Path $PSScriptRoot '..\zaun-icons'),
    [string]$OutputDirectory = (Join-Path $PSScriptRoot '..\zaun-icons-transparent')
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
Add-Type -ReferencedAssemblies System.Drawing -TypeDefinition @'
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;

public static class ZaunCutout {
    public static int Remove(string source, string destination) {
        using (var input = new Bitmap(source))
        using (var output = new Bitmap(input.Width, input.Height, PixelFormat.Format32bppArgb)) {
            int w = input.Width, h = input.Height;
            var corners = new [] { input.GetPixel(0, 0), input.GetPixel(w-1, 0),
                input.GetPixel(0, h-1), input.GetPixel(w-1, h-1) };
            int r = 0, g = 0, b = 0;
            foreach (var c in corners) { r += c.R; g += c.G; b += c.B; }
            r /= 4; g /= 4; b /= 4;
            var visited = new bool[w*h];
            var background = new bool[w*h];
            var queue = new Queue<int>();
            for (int x = 0; x < w; x++) { queue.Enqueue(x); queue.Enqueue((h-1)*w+x); }
            // This supplied browser icon is cropped through its right frame.
            // Do not seed that exposed interior as background.
            bool clippedRightFrame = source.Replace('\\', '/').EndsWith("skill-categories/web-development.png");
            int tolerance = source.Replace('\\', '/').EndsWith("skill-categories/programming.png") ? 26 : 18;
            for (int y = 0; y < h; y++) {
                queue.Enqueue(y*w);
                if (!clippedRightFrame) queue.Enqueue(y*w+w-1);
            }
            int removed = 0;
            while (queue.Count > 0) {
                int p = queue.Dequeue();
                if (visited[p]) continue;
                visited[p] = true;
                int x = p % w, y = p / w;
                var c = input.GetPixel(x, y);
                // Only the dark green matte connected to an image edge is removed.
                // Bright green glow, brass frames, and enclosed dark details are preserved.
                if (Math.Abs(c.R-r) > tolerance || Math.Abs(c.G-g) > tolerance ||
                    Math.Abs(c.B-b) > tolerance) continue;
                if (tolerance == 18 && (c.G < c.R || c.G < c.B)) continue;
                background[p] = true;
                removed++;
                if (x > 0) queue.Enqueue(p-1);
                if (x+1 < w) queue.Enqueue(p+1);
                if (y > 0) queue.Enqueue(p-w);
                if (y+1 < h) queue.Enqueue(p+w);
            }
            if (removed == 0 || removed > w*h*0.85)
                throw new Exception("Unexpected background coverage: " + source);
            // Drop isolated matte specks without changing any retained RGB values.
            var checkedPixel = new bool[w*h];
            for (int start = 0; start < w*h; start++) {
                if (background[start] || checkedPixel[start]) continue;
                var component = new List<int>();
                int minX = w, maxX = -1;
                queue.Enqueue(start);
                checkedPixel[start] = true;
                while (queue.Count > 0) {
                    int p = queue.Dequeue();
                    component.Add(p);
                    int px = p % w, py = p / w;
                    minX = Math.Min(minX, px);
                    maxX = Math.Max(maxX, px);
                    for (int dy = -1; dy <= 1; dy++) for (int dx = -1; dx <= 1; dx++) {
                        int nx = px+dx, ny = py+dy;
                        if (nx < 0 || nx >= w || ny < 0 || ny >= h) continue;
                        int np = ny*w+nx;
                        if (background[np] || checkedPixel[np]) continue;
                        checkedPixel[np] = true;
                        queue.Enqueue(np);
                    }
                }
                if (component.Count <= 8 || (minX >= w-2 && maxX-minX <= 1)) foreach (int p in component) {
                    background[p] = true;
                    removed++;
                }
            }
            for (int y = 0; y < h; y++) for (int x = 0; x < w; x++) {
                var c = input.GetPixel(x, y);
                output.SetPixel(x, y, background[y*w+x] ? Color.FromArgb(0,c.R,c.G,c.B) : c);
            }
            output.Save(destination, ImageFormat.Png);
            return removed;
        }
    }
}
'@

$sourceRoot = (Resolve-Path -LiteralPath $SourceDirectory).Path
$outputRoot = [IO.Path]::GetFullPath($OutputDirectory)
Get-ChildItem -LiteralPath $sourceRoot -Recurse -File -Filter '*.png' | ForEach-Object {
    $relative = $_.FullName.Substring($sourceRoot.Length + 1)
    $destination = Join-Path $outputRoot $relative
    [IO.Directory]::CreateDirectory([IO.Path]::GetDirectoryName($destination)) | Out-Null
    $removed = [ZaunCutout]::Remove($_.FullName, $destination)
    [pscustomobject]@{ Icon = $relative; TransparentPixels = $removed }
}
