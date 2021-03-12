---
tags: visualstudiocode, extension, typescript
author: Brandon Ambuila
---

## Steps to Create a Visual Studio Code extension

Install Yeoman and VS Code Extension Generator
```
npm install -g yo generator-code
```

Run the generator and complete a few fields for create the project
```
yo code

# ? What type of extension do you want to create? New Extension (TypeScript)
# ? What's the name of your extension? HelloWorld
### Press <Enter> to choose default for all options below ###

# ? What's the identifier of your extension? helloworld
# ? What's the description of your extension? LEAVE BLANK
# ? Initialize a git repository? Yes
# ? Bundle the source code with webpack? No
# ? Which package manager to use? npm
```
Open Visual Studio Code in the project
```
code ./helloworld
```
Now press `F5` for compile the extension

In the new window press `Ctrl+Shift+P` and run the command `Hello World` in the Command Palette
