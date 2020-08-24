---
tags: android
author: Edison Arango
---

## APK Sign

```
keytool -genkey -v -keystore signtix.keystore  -keyalg RSA -keysize 2048 -validity 10000 -alias signtix

zipalign -v -p 4 signage-unsigned.apk signage-unsigned-aligned.apk

apksigner sign --ks uss.keystore --out signage.apk signage-unsigned-aligned.apk
```

### Get targetSdkVersion from apk

```
aapt dump badging <name.apk> | grep dkVersion
```
