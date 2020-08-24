---
tags: docker digitalocean
author: Edison Arango
---

## First server

### List volumes
```
docker volume ls
```

### Inspect volume
```
docker volume inspect <my_volume>
```

### Create tar backup of volume
```
tar -czvf <filename>.tar.gz -C <volume location> .
```
> **NOTE:** The -C option is to make tarball to change the directory, this means we won't
store the the entire path of the files in the tar file.

> **NOTE:** The dot `.` at the end is important

Example
```
tar -czvf volume-bk.tar.gz -C /var/lib/docker/volumes/my_volume/_data .
```

## Locally

### Push ssh private keys to first server
```
scp -i ~/.ssh/<first_server_key> ~/.ssh/<second_server_key>* <first_server_user>@<first_server_host>:<first_server_dir>
```

## First server

### Push tar backup to second server
```
scp -i <second_server_key> <tarfile>.tar.gz <second_server_user>@<second_server_host>:<second_server_dir>
```

## Second server

### Extract tarfile into the giving folder
```
tar -xzvf <tarfile>.tar.gz -C <dest>
```

Example:
```
tar -xzvf volume-bk.tar.gz -C my_dir
```
> **TIP:** Because of permissions you may need to run the previous command with `sudo`

### Change permissions
The tarball keeps the original permissions of the files, therefore you may need to change the permissions of the extracted files
```
sudo chown -R <second_serveruser>:<second_serveruser> <extracted_dir>
```

### Finally
Do not forget to delete the keys of the second server from the first server:
```
rm <second_server_key>*
```
