 🎯 organize_live — Post-Recon Live URL Organizer

This script takes output from recon tools like `gf`, `httpx`, and `nuclei`, and filters **live, reachable attack surfaces** for further manual testing.

---

## ✅ Features

- 📂 Organizes live URLs by vector:
  - All URLs
  - URLs with params
  - GF matches: XSS, SQLi, SSRF
  - Sensitive endpoints (`/admin`, `/login`, `/upload`)
- ⚡ Uses `httpx` to validate reachability
- 📄 Outputs sorted live results to `/organized_live/`

---

## ⚙️ Requirements

Install `httpx`:

```bash
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
🚀 Usage

chmod +x organize_live.sh
./organize_live.sh
Make sure these input files exist:

live_urls.txt
urls_with_params.txt
gf_xss.txt
gf_sqli.txt
gf_ssrf.txt
interesting_endpoints.txt

📂 Output

Saved to organized_live/:

live_final.txt
live_params.txt
live_gf_xss.txt
live_gf_sqli.txt
live_gf_ssrf.txt
live_sensitive.txt
