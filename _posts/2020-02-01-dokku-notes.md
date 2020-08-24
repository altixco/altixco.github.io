---
tags: dokku
author: Edison Arango
---

## Installation and Configuration

After installing with `curl | bash`, or another way you should go to the server ip or domain name.

Dokku allows users to push with the ssh public key, in Mac it's usually a file located here **"~/.ssh/id_rsa.pub"**

To manage dokku ssh-keys run inside the dokku machine:

```
dokku ssh-keys
```

Follow these steps to create the ssh key if it does not exist:

- https://superuser.com/a/761026

Dokku allows access of ssh keys inside */home/dokku/.ssh/authorized_keys*
Add new ssh .pub files inside */home/dokku/.ssh/* to give and user access

> See user management:
> - http://dokku.viewdocs.io/dokku/deployment/user-management/

Dokku always watches for changes in master branch, if you use a different branch locally the push it this way:

```
git push dokku <my-branch>:master
```

If the application uses a different port than 80 See: 
- http://dokku.viewdocs.io/dokku~v0.14.6/networking/port-management/

Tutorial to deploy to dokku from travis:
- http://blog.abarbanell.de/linux/2017/09/09/deploy-from-travis-to-dokku/

## Useful commands

Clear non stoped unused containers:

```
docker ps -q --format={{.Names}} | grep -P '^\w+$|\.\d{10,}$' | xargs docker rm -f
```

## NGINX config

Avoid passing unknown or not allowed hosts
See: https://github.com/dokku/dokku/blob/master/docs/configuration/domains.md#default-site

```
# Avoid passing unknown or not allowed hosts
server {
  # If no Host match, close the connection to prevent host spoofing
  listen 80 default_server;
  server_name _;
  return 444;
}
```
