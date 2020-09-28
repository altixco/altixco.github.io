---
title: The easiest way to update your Node.js on Mac
tags: mac, node
author: Edison Arango
---

Several new JavaScript libraries in the NPM require the latest Node.js version, so you should keep updating your Node.js. Let’s see the easiest way how to do it!

## 1. Open your console and check your Node.js version.

```bash
$ node -v
v x.x.x
```

## 2. Install ![n](https://www.npmjs.com/package/n) package using npm if you do not have it installed yet.

```bash
$ sudo npm install -g n
```


## 3. Then, you can update your Node.js to the version you want.

```bash
(Use this command to install the stable node release.)
$ sudo n stable

(Use this command to install/update the latest node release.)
$ sudo n latest

(Use this command to install/update the latest LTS node release.)
$ sudo n lts
```

## 4. That’s it! You can verify that the update is successful by checking your Node.js version again.

```bash
$ node -v
v x.x.x
```

### Credits:
- https://medium.com/macoclock/update-your-node-js-on-your-mac-in-2020-948948c1ffb2
