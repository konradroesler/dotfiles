let
  domains = [
    "youtube.com"
    "www.youtube.com"
    "m.youtube.com"
    "reddit.com"
    "www.reddit.com"
    "old.reddit.com"
    "new.reddit.com"
    "instagram.com"
    "www.instagram.com"
  ];
in {
  networking.hosts = {
    "127.0.0.1" = domains;
    "::1" = domains;
  };

  security.pki.certificateFiles = [./mkcert-root.pem];

  services.caddy = {
    enable = true;
    virtualHosts."youtube.com" = {
      serverAliases = builtins.tail domains;
      extraConfig = ''
            tls /var/lib/caddy/certs/sites.pem /var/lib/caddy/certs/sites-key.pem
        redir http://localhost:8000/scratchpad
      '';
    };
  };
}
