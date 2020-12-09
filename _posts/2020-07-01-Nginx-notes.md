---
tags: nginx
author: Edison Arango
---

# NGINX Notes

## Config files

Avoid processing unknown or not allowed hosts and prevent host spoofing
- See: https://stackoverflow.com/a/47851675/4873750
- See: http://nginx.org/en/docs/http/request_processing.html#how_to_prevent_undefined_server_names

```
# Avoid passing unknown or not allowed hosts
server {
  # If no Host match, close the connection to prevent host spoofing
  listen 80 default_server;
  server_name _;
  return 444;
}
```

## Redirect www to non-www

```
server {
    server_name www.example.com;
    return 301 $scheme://example.com$request_uri;
}
```
