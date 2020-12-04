Fix APNS error [SSL: CA_MD_TOO_WEAK] ca md too weak 
============

This is one open issue in **django-push-notification** reported [here](https://github.com/jazzband/django-push-notifications/issues/532)

The workaround is editing in the docker container the next file `/etc/ssl/openssl.cnf` and setting the following value:

`CipherString = DEFAULT@SECLEVEL=1`
