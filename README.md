# Hi there 👋, I'm Carl Matthew T. Castro  

---

## 👨‍💻 About Me  
🎂 Age: *21*  
🎓 Currently enrolled at **Laguna State Polytechnic University – Santa Cruz Campus**  
📚 Program: **Bachelor of Science in Information Technology (BSIT)**  
💡 Interested in **Cybersecurity** and **Software Development**  
🎸 Fun fact: I play the **guitar**  

---

## 🎯 Goals  
🚀 Improve my skills in **C#, Python, CSS, and Java**  
🛠 Develop meaningful projects that can benefit my Community  
🗄 Learn more about **databases (SQL)** and **full-stack development**  

---

## 🌐 Socials:

<a href="https://facebook.com/@ymkze.xviii" target="_blank">
  <img src="https://img.shields.io/badge/Facebook-%231877F2.svg?logo=Facebook&logoColor=white" alt="Facebook"/>
</a>


<a href="https://instagram.com/@ymkze.xviii" target="_blank">
  <img src="https://img.shields.io/badge/Instagram-%23E4405F.svg?logo=Instagram&logoColor=white" alt="Instagram"/>
</a>

<a href="https://youtube.com/@ymkzexviii" target="_blank">
  <img src="https://img.shields.io/badge/YouTube-%23FF0000.svg?logo=YouTube&logoColor=white" alt="YouTube"/>
</a>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Contact — Open Gmail Compose</title>
  <style>
    body {
      font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
      min-height: 100vh;
      display: grid;
      place-items: center;
      background: #f7fafc;
      margin: 0;
      padding: 24px;
    }
    .card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(20,20,40,0.08);
      padding: 28px;
      width: 340px;
      text-align: center;
    }
    h1 { margin: 0 0 12px 0; font-size: 20px; }
    p { margin: 0 0 18px 0; color: #374151; font-size: 14px; }
    .btn {
      display: inline-block;
      padding: 10px 14px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
      font-weight: 600;
      font-size: 14px;
      margin: 6px;
    }
    .btn-primary { background: #1a73e8; color: white; }
    .btn-ghost { background: transparent; border: 1px solid #d1d5db; }
    .email-display { font-family: monospace; color: #0f172a; margin-top: 12px; word-break: break-all; }
    .notice { color: #6b7280; font-size: 13px; margin-top: 10px; }
  </style>
</head>
<body>
  <div class="card" role="region" aria-label="Contact card">
    <h1>Send me an email</h1>
    <p>Click the button to open Gmail's compose window (or use the fallback mail app).</p>

    <!-- Replace this value with your Gmail address -->
    <script>const MY_EMAIL = 'youremail@gmail.com';</script>

    <div>
      <button id="openGmail" class="btn btn-primary" title="Open Gmail compose">Open Gmail compose</button>
      <button id="mailto" class="btn btn-ghost" title="Open default mail app">Open mail client</button>
    </div>

    <div>
      <button id="copyEmail" class="btn" title="Copy email to clipboard">Copy email</button>
    </div>

    <div class="email-display" id="emailDisplay" aria-live="polite"></div>
    <div class="notice">If you aren't signed into Gmail in this browser, the Gmail link will ask you to sign in first.</div>
  </div>

  <script>
    // --- Configuration: change only the MY_EMAIL value above ---
    // If you want subject/body prefilled, edit subject/body below (URL-encoded)
    const subject = encodeURIComponent('Hello');
    const body = encodeURIComponent('Hi — I found your contact and wanted to reach out.');
    const gmailUrl = (email) => `https://mail.google.com/mail/?view=cm&to=${encodeURIComponent(email)}&su=${subject}&body=${body}`;
    const mailtoUrl = (email) => `mailto:${encodeURIComponent(email)}?subject=${subject}&body=${body}`;

    // UI elements
    const openGmailBtn = document.getElementById('openGmail');
    const mailtoBtn     = document.getElementById('mailto');
    const copyBtn       = document.getElementById('copyEmail');
    const display       = document.getElementById('emailDisplay');

    // Show the email on the page (so users can see/copy it)
    display.textContent = MY_EMAIL;

    // Open Gmail compose in a new tab
    openGmailBtn.addEventListener('click', () => {
      const w = window.open(gmailUrl(MY_EMAIL), '_blank', 'noopener,noreferrer');
      // Some browsers block popups; fallback to mailto if open failed
      if (!w) {
        // best-effort fallback:
        window.location.href = mailtoUrl(MY_EMAIL);
      }
    });

    // Open default mail client (mailto:)
    mailtoBtn.addEventListener('click', () => {
      window.location.href = mailtoUrl(MY_EMAIL);
    });

    // Copy the email to clipboard with feedback
    copyBtn.addEventListener('click', async () => {
      try {
        await navigator.clipboard.writeText(MY_EMAIL);
        copyBtn.textContent = 'Copied!';
        setTimeout(()=> copyBtn.textContent = 'Copy email', 1400);
      } catch (err) {
        // fallback: select text to allow manual copy
        const el = document.createElement('textarea');
        el.value = MY_EMAIL;
        document.body.appendChild(el);
        el.select();
        try { document.execCommand('copy'); copyBtn.textContent = 'Copied!'; }
        catch (e) { alert('Copy failed — please select and copy the address: ' + MY_EMAIL); }
        document.body.removeChild(el);
        setTimeout(()=> copyBtn.textContent = 'Copy email', 1400);
      }
    });
  </script>
</body>
</html>


---

## 📌 Current Projects  

📖 Learning **Git** and **GitHub** for version control  
💻 Developing **practice projects** in Python and C#  
📲 Learning **Android Studio** for mobile app development  
🗄  Practicing **MySQL Workbench** for database design and queries  
🛠 Exploring **Visual Studio Code** and **Eclipse** for software development  

---

## 🛠 Languages & Tools  

<div align="center">

![C#](https://img.shields.io/badge/c%23-%23239120.svg?style=for-the-badge&logo=csharp&logoColor=white) 
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white) 
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) 
![HTML5](https://img.shields.io/badge/html-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) 
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white) 
![Adobe Photoshop](https://img.shields.io/badge/adobe%20photoshop-%2331A8FF.svg?style=for-the-badge&logo=adobe%20photoshop&logoColor=white) 
![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white) 
![Squarespace](https://img.shields.io/badge/Squarespace-000000.svg?style=for-the-badge&logo=squarespace&logoColor=white)
![Lucidchart](https://img.shields.io/badge/Lucidchart-F06529.svg?style=for-the-badge&logo=lucidchart&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/VSCode-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white) 
![Eclipse](https://img.shields.io/badge/Eclipse-2C2255.svg?style=for-the-badge&logo=eclipse&logoColor=white)  

</div>

---

## 🛠 Skills  
💻 Beginner in **Python**, **C#**, **SQL**, and **Java**  
🌐 Familiar with **HTML**, **CSS**, and **basic Git/GitHub**  
🔍 Always eager to explore and learn new technologies  
  
---

## 📊 GitHub Stats Dashboard

<div align="center">

  <img src="https://github-readme-stats.vercel.app/api?username=carlmatthewcastro&show_icons=true&theme=radical&hide_border=false" alt="GitHub Stats" />

  <img src="https://nirzak-streak-stats.vercel.app/?user=carlmatthewcastro&theme=radical&hide_border=false" alt="Streak Stats" />
  
</div>

---

## **🏆 GitHub Trophies**
<img src="https://github-profile-trophy.vercel.app/?username=carlmatthewcastro&theme=radical&no-frame=false&no-bg=true&margin-w=4" alt="GitHub Trophies" />

<div align="center">
  
⭐ *“Code, Learn, Improve, Repeat.”*

</div>

---

