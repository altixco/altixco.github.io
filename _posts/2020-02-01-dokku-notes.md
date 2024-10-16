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

{% raw %}
```
docker ps -q --format={{.Names}} | grep -P '^\w+$|\.\d{10,}$' | xargs docker rm -f
```
{% endraw %}

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

## Fix allow CORS: Access-Control-Allow-Origin  

nginx configuration `cors` should be placed server side in: `/home/dokku/<app>/nginx.conf.d/cors.conf`

should look like:

```
add_header "Access-Control-Allow-Origin" * always;
add_header "Access-Control-Allow-Methods" "GET, POST, PUT, OPTIONS, HEAD, PATCH, DELETE" always;
add_header "Access-Control-Allow-Headers" "Authorization, Origin, X-Requested-With, Content-Type, Accept" always;

if ($request_method = OPTIONS) {
  return 204;
}
```
then restart nginx:

`sudo systemctl reload nginx`

## How to set volume for dokku-persistent-storage

Run the following command to link the storage directory for that app to the `/src/media` folder, for example:

`dokku storage:mount <app> /home/dokku/<app>/media:/src/media`

List bind mounts for app's container(s) (host:container)

`dokku storage:list <app>`


## How import a sql backup file in Dokku

So you can use `postgres:import` [see here](https://github.com/dokku/dokku-postgres#import-a-dump-into-the-postgres-service-database) for any non-plain-text formats created by pg_dump. For .sql files you’ll need to feed directly `psql` thus using postgres:connect instead.

`dokku postgres:connect app < file.sql`

hola
