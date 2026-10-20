# Site redirects (YouTube, Reddit, Instagram → localhost)

Requests to the sites in the `domains` list are sent to this machine (via `networking.hosts`)
and forwarded by Caddy to `localhost:8080`. Because these sites force HTTPS, Caddy presents
a certificate signed by a local CA created with `mkcert`, which the browsers and system trust.

Files involved:

| File | Where | In Git? |
|---|---|---|
| `mkcert-root.pem` (public CA cert) | `system/shenanigans/` | **yes** (must be `git add`ed for flakes) |
| `rootCA-key.pem` (CA private key) | `$(mkcert -CAROOT)` | **never** |
| `sites.pem` / `sites-key.pem` (site cert + key) | `/var/lib/caddy/certs/`, working copy in `~/.local/share/site-certs/` | **never** |

---

## 1. First setup

Run as your normal user (not sudo), with Firefox/Chrome closed.

```bash
# Tools
nix-shell -p mkcert nssTools

# Create the local CA and trust it in Firefox/Chrome.
# An error about the system trust store is expected on NixOS; the config handles that.
mkcert -install

# Put the public CA cert into the config repo
cp "$(mkcert -CAROOT)/rootCA.pem" ~/.dotfiles/system/shenanigans/mkcert-root.pem
git -C ~/.dotfiles add system/shenanigans/mkcert-root.pem

# Generate the site certificate OUTSIDE the repo.
# The domain list must match the `domains` list in the Nix config.
mkdir -p ~/.local/share/site-certs && cd ~/.local/share/site-certs
mkcert -cert-file sites.pem -key-file sites-key.pem \
  youtube.com www.youtube.com m.youtube.com \
  reddit.com www.reddit.com old.reddit.com new.reddit.com \
  instagram.com www.instagram.com

exit   # leave nix-shell

# Apply the config (Caddy may fail to start this first time; that's fine)
sudo nixos-rebuild switch --flake /path/to/config

# Install the certificate for Caddy
sudo install -d -o caddy -g caddy -m 700 /var/lib/caddy/certs
sudo install -o caddy -g caddy -m 600 \
  ~/.local/share/site-certs/sites.pem ~/.local/share/site-certs/sites-key.pem \
  /var/lib/caddy/certs/
sudo systemctl restart caddy
```

Check it works, then restart the browser:

```bash
curl -v https://youtube.com     # should show your local site, no certificate error
```

---

## 2. Adding (or removing) a site

The CA does **not** need to be recreated. Only the site certificate and the config change.

1. **Edit the `domains` list** in the Nix config. Include the bare domain and any subdomains
   you use (e.g. `example.com` and `www.example.com`).

2. **Regenerate the certificate with the complete list.** The new certificate replaces the old
   one, so list *all* domains, not just the new ones:

   ```bash
   nix-shell -p mkcert --run '
     cd ~/.local/share/site-certs &&
     mkcert -cert-file sites.pem -key-file sites-key.pem \
       youtube.com www.youtube.com m.youtube.com \
       reddit.com www.reddit.com old.reddit.com new.reddit.com \
       instagram.com www.instagram.com \
       NEW-DOMAIN.com www.NEW-DOMAIN.com'
   ```

3. **Install the new certificate:**

   ```bash
   sudo install -o caddy -g caddy -m 600 \
     ~/.local/share/site-certs/sites.pem ~/.local/share/site-certs/sites-key.pem \
     /var/lib/caddy/certs/
   ```

4. **Rebuild and restart Caddy** (a rebuild alone doesn't reload a changed certificate file):

   ```bash
   sudo nixos-rebuild switch --flake /path/to/config
   sudo systemctl restart caddy
   ```

5. Restart the browser and test with `curl -v https://NEW-DOMAIN.com`.

---

## Which steps to redo when

| Situation | Redo |
|---|---|
| Added/removed a domain | Section 2 |
| Changed only the target port or other Caddy settings | Just `nixos-rebuild switch` |
| New machine, reinstall, or deleted `$(mkcert -CAROOT)` | All of section 1 (new CA → replace `mkcert-root.pem` in the repo) |
| New browser profile, or a browser shows a certificate error | `mkcert -install` (browsers closed) |

## Troubleshooting

- **Real site still loads:** the browser is using DNS-over-HTTPS and bypassing `/etc/hosts`.
  Turn it off (Firefox: Settings → Privacy & Security; Chrome: "Use secure DNS").
- **`Path '…' does not exist in Git repository`:** a file used by the flake isn't staged.
  `git add` it.
- **`install: cannot stat …`:** you're not in the folder with the `.pem` files. Use the full
  paths shown above.
- **Flatpak/Snap browsers:** they use their own certificate stores; `mkcert -install` doesn't reach them.

## Removing everything

```bash
nix-shell -p mkcert nssTools --run 'mkcert -uninstall'
sudo rm -r /var/lib/caddy/certs ~/.local/share/site-certs
```

Then delete the hosts/Caddy/`security.pki` config and `mkcert-root.pem` from the repo and rebuild.
