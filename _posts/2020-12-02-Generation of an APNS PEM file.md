Generation of an APNS PEM file
------------------------------

The ``APNS_CERTIFICATE`` setting must reference the location of a PEM file. This file must contain a certificate and private key pair allowing a secure connection to Apple's push gateway.

These instructions assume the use of Mac OS X.

There are two main steps involved; generating the certificate, then conversion of this certificate into `PEM` format for use with this library.

## Generating the push certificate

Using `Apple's Developer site <https://developer.apple.com/account>`_ you need to generate a push notification certificate for either development or production. It is documented [here](https://knowledge.altix.co/2020/12/02/Generate-APNS-certificate-for-iOS-Push-Notifications.html). 

The end result should be an exported certificate and private key with the `p12` extension.

## Converting the certificate to `PEM` format

The flow is similar for **development** and **production** environments. These steps are adapted from a [Stack Overflow post](https://stackoverflow.com/a/27942504/4664727)

**Step 1:** Create Certificate .pem from Certificate .p12

```
   $ openssl pkcs12 -clcerts -nokeys -out aps-cert.pem -in Certificates.p12
```

**Step 2** Create Key .pem from Key .p12

```
   $ openssl pkcs12 -nocerts -out aps-key.pem -in Certificates.p1
```

**Step 3** Remove pass phrase on the key

```
	$ openssl rsa -in aps-key.pem -out aps-key-noenc.pem
```  

**Step 4** Combine the two into one file

```
	$ cat aps-cert.pem aps-key-noenc.pem > aps.pem
```

**Step 5** Check certificate validity and connectivity to APNS

```
	$ openssl s_client -connect gateway.push.apple.com:2195 -cert aps-cert.pem -key aps-key-noenc.pem
```

If the certificate and key are valid, the connection will open and remain open. If it is not the connection will be closed and an error potentially displayed.

To test if the certificate works in sandbox mode, simply replace the `gateway` with `gateway.sandbox.push.apple.com:2195`.
