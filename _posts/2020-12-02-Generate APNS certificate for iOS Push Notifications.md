Generate APNS certificate for iOS Push Notifications
====================================================

Apple Push Notification Service (commonly referred to as Apple Notification Service or APNS) is a platform service created by Apple Inc. that enables third party application developers to send push notifications to iOS users.

### 1. Generate a Certificate from Keychain Access
Launch the Keychain Access application in your Mac OS X and Select Keychain Access 

> Certificate Assistant > Request a Certificate From a Certificate Authority

Enter email address and check the ‘Saved to disk’ option, then click Continue

### 2. Login to Apple developer account and click [Certificates, Identifiers and Profiles](https://developer.apple.com/account/resources/certificates/list)

- Select app from App IDs and click Edit
- Scroll Down to Push Notification and click Configure
- Find Development SSL certificates and click Create Certificate
- Choose certificate file created from Keychain Access in previous section and click Continue
- Download Development Certificate and click Done to finish process
- Double click Development certificate generated in previous step to add it to Keychain Access

### 3. Generate APNS .p12 certificate

- Go to Keychain Access, select login keychain and My Certificate from side menu. Find app certificate and right click to export it
- Enter certificate name and click Save
- Enter password for certificate and click OK
- Enter your computer admin password to finish the process

*Boom! This development .p12 certificate can be used to send push notification.*





