# Honahaarjawan-Project
Penetration testing  


# RECON SIMPLE - Basic Console-Based Reconnaissance Tool

## 📌 Overview
RECON SIMPLE is a lightweight Bash script designed to perform basic reconnaissance tasks during penetration testing. It displays results directly on the console without generating any files, making it ideal for quick assessments and learning purposes. The tool automates WHOIS lookup, DNS enumeration, subdomain brute-forcing, and fast port scanning.

## 🎯 Features
- **WHOIS Lookup** – Retrieve domain registration information.
- **DNS Enumeration** – Display A, MX, NS, and TXT records.
- **Subdomain Brute-Forcing** – Check common subdomains (www, mail, admin, etc.).
- **Fast Port Scan** – Scan top 100 ports using Nmap (`-F -T4`).
- **Console-Only Output** – No files saved; results shown on screen.
- **Color-Coded Output** – Easy-to-read colored sections.
- **Pause Between Sections** – Press Enter to continue after each phase.

## ⚙️ Requirements
- **Operating System:** Linux (tested on Kali Linux)
- **Tools Installed:**
  - `whois`
  - `dig` (from dnsutils)
  - `host` (from dnsutils)
  - `nmap`
- **Permissions:** Execute permissions on the script.

## 🔧 Installation
1. Clone or download the script.
2. Make it executable:
   ```bash
   chmod +x recon-simple.sh
