---
tags: ubuntu, ssh, sudo, root, digitalocean, server, devops
author: Edison Arango
---

## Steps to Create a New Sudo User

Log in to your server as the root user.
```
ssh root@server_ip_address
```

Create the new user along with its home directory
```
adduser <username>
```
> In the previous command add the user information and its password

Use the usermod command to add the user to the sudo group.
```
usermod -aG sudo <username>
```

### Testing sudo access

Switch to the user
```
su - <username>
```

Verify sudo privileges with the following command and entering the user password
```
sudo ls -la /root
```

## Steps to allow SSH access to the new user

Locally generate a new SSH key using
```
ssh-keygen
```

In the server switch to the user
```
su - <username>
```

CD to the userhome
```
cd ~
```

Create the `.ssh` directory
```
mkdir .ssh
```

Create the authorized keys file
```
touch .ssh/authorized_keys
```

Then edit it and add the contents of the public key just created with ssh-keygen
```
nano .ssh/authorized_keys
```
> It's important not to leave empty lines at the end of the file

Finally configure the correct permissions for the files
```
chmod 0700 .ssh
chmod 0600 .ssh/authorized_keys
```

### Testing the SSH config

Just type the following
```
ssh -i <path_to_private_key> <username>@<host>
```
