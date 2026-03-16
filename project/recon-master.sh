#!/bin/bash

# ============================================================================
# RECON SIMPLE - Basic Reconnaissance Tool (Console Output Only)
# Author: Syed Mujtaba Zaidi
# Date: March 2026
# ============================================================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Banner
clear
echo -e "${GREEN}"
echo "=========================================="
echo "     RECONNAISSANCE TOOL (CONSOLE)"
echo "=========================================="
echo -e "${NC}"

# Input domain
echo -e "${YELLOW}Enter target domain:${NC}"
read domain

if [ -z "$domain" ]; then
    echo -e "${RED}Error: Domain cannot be empty${NC}"
    exit 1
fi

echo -e "${BLUE}Target: $domain${NC}"
echo ""

# ---------------------------- WHOIS ---------------------------------
echo -e "${GREEN}[1] WHOIS Lookup${NC}"
echo "=========================================="
whois "$domain" 2>/dev/null | head -30
echo ""
read -p "Press Enter to continue..."

# ---------------------------- DNS Enumeration -----------------------
echo -e "${GREEN}[2] DNS Enumeration${NC}"
echo "=========================================="
echo -e "${YELLOW}A Records:${NC}"
dig "$domain" A +short
echo ""
echo -e "${YELLOW}MX Records:${NC}"
dig "$domain" MX +short
echo ""
echo -e "${YELLOW}NS Records:${NC}"
dig "$domain" NS +short
echo ""
echo -e "${YELLOW}TXT Records:${NC}"
dig "$domain" TXT +short
echo ""
read -p "Press Enter to continue..."

# ---------------------------- Subdomain Enumeration -----------------
echo -e "${GREEN}[3] Subdomain Enumeration${NC}"
echo "=========================================="
sublist=("www" "mail" "ftp" "admin" "webmail" "smtp" "pop" "ns1" "ns2" "cpanel" "whm" "dev" "test" "staging" "api" "blog" "shop" "portal" "vpn" "remote")
found=0

for sub in "${sublist[@]}"; do
    result=$(host "$sub.$domain" 2>&1)
    if [[ $result != *"not found"* ]] && [[ $result != *"NXDOMAIN"* ]]; then
        echo -e "${GREEN}[+] Found: $sub.$domain${NC}"
        echo "$result" | grep "has address"
        ((found++))
    fi
done

if [ $found -eq 0 ]; then
    echo -e "${YELLOW}No subdomains found${NC}"
else
    echo -e "${GREEN}Total found: $found${NC}"
fi
echo ""
read -p "Press Enter to continue..."

# ---------------------------- Port Scan ------------------------------
echo -e "${GREEN}[4] Port Scan (Fast Scan)${NC}"
echo "=========================================="
echo -e "${YELLOW}Scanning top 100 ports...${NC}"
nmap -F -T4 "$domain"
echo ""

# ---------------------------- Completion -----------------------------
echo -e "${GREEN}"
echo "=========================================="
echo "     SCAN COMPLETED"
echo "=========================================="
echo -e "${NC}"
echo -e "${BLUE}Target: $domain${NC}"
echo -e "${BLUE}Date: $(date)${NC}"
