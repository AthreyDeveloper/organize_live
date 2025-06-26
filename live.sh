#!/bin/bash

echo "[+] Filtering reachable endpoints by attack vector..."

mkdir -p organized_live

# 1. All live URLs
sort -u live_urls.txt > organized_live/live_final.txt

# 2. Param URLs that are still live
cat urls_with_params.txt | sort -u | httpx -silent -mc 200,403 -o organized_live/live_params.txt

# 3. Filter XSS
cat gf_xss.txt | sort -u | httpx -silent -mc 200,403 -o organized_live/live_gf_xss.txt

# 4. Filter SQLi
cat gf_sqli.txt | sort -u | httpx -silent -mc 200,403 -o organized_live/live_gf_sqli.txt

# 5. Filter SSRF
cat gf_ssrf.txt | sort -u | httpx -silent -mc 200,403 -o organized_live/live_gf_ssrf.txt

# 6. Filter sensitive endpoints (admin, login, upload, etc.)
cat interesting_endpoints.txt | sort -u | httpx -silent -mc 200,403 -o organized_live/live_sensitive.txt

echo "[+] Done! Organized endpoints saved in /organized_live"
