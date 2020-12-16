---
tags: rsync, digitalocean, linux, devops, infrastructure, migration
author: Edison Arango
---

## SSH Config

It is complex to configure the SSH identity key for Rsync, therefore it's better to configure this in your `~/.ssh/config`.

```
Host hostname
    User username
    IdentityFile ~/.ssh/somekey
```

## Commands

Then you can synchronize to a server using this command
```
rsync -av directory remote_user@hostname.com:/remote/path/
```
> Which means copy the `directory` to the remote path

In case you need to copy the contents of a directory then use
```
rsync -av directory/ remote_user@hostname.com:/remote/path/
```
> Note the `/` after the directory

## More information

For more information, See: 
- https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories
- https://unix.stackexchange.com/questions/127352/specify-identity-file-id-rsa-with-rsync
