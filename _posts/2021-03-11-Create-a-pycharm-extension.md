---
tags: pycharm, extension, kotlin, java
author: Brandon Ambuila
---

## Steps to Create a IntelliJ extension

Install [IntelliJ IDEA](https://www.jetbrains.com/idea/download/)

Open IntelliJ IDEA and select New Project button

Now in `Gradle` section select `IntelliJ Platform Plugin` and `Kotlin/JVM`:

![alt text](/assets/img/plugin_select_gradle_intellijidea.png "Select gradle")

Press `Next` and set the project name.

Open `src/main/resources/META-INF/plugin.xml` file:

Now we need add actions. Inside `actions tag` create a group with `id`, `text` and `description`:

```
<actions>
    <group id="post.HelloAction" text="MyIdeaDemo" description="about my idea">
        <add-to-group group-id="MainMenu" anchor="last"/>
    </group>
</actions>
```

Create action with `class`, `id` and `text`:

```
<actions>
    <group id="post.HelloAction" text="MyIdeaDemo" description="about my idea">
        <add-to-group group-id="MainMenu" anchor="last"/>
        <action class="com.post.myideademo.HelloAction" id="post.Actions.HelloActions" text="Say Hello"/>
    </group>
</actions>
```

Create `com.post.myideademo` package inside `src/main/kotlin` folder:

![alt text](/assets/img/plugin_new_package_intellijidea.png "New package")

Create the HelloAction kotlin class inside package:

![alt text](/assets/img/plugin_ktlin_class_intellijidea.png "Kotlin class")

Open kotlin file and implement AnAction in HelloWorld class:

```
class HelloAction: AnAction() {
    override fun actionPerformed(e: AnActionEvent) {
```

Now import Messages from open.api.ui:

```
import com.intellij.openapi.ui.Messages
```

And use messaged for read and ahow an APIKey:

```
class HelloAction: AnAction() {
    override fun actionPerformed(e: AnActionEvent) {
        val apiKey = Messages.showInputDialog(e.project, "Enter your APIKey", "APIKey", Messages.getQuestionIcon())
        Messages.showMessageDialog(e.project, "Your APIKey is $apiKey", "My APIKey", Messages.getInformationIcon())
    }
}
```

## Run a IntelliJ extension

Open gradle tab located in the left and run `tasks/intellij/runide`:

![alt text](/assets/img/plugin_gradle_runide_intellijidea.png "Gradle runide")

Now has been open a new IntelliJ IDEA window, then select the action:

![alt text](/assets/img/plugin_menu_intellijidea.png "Menu")

Enter an APIKey an press `ok`:

![alt text](/assets/img/plugin_enter_api_key_intellijidea.png "Enter api key")

Now your APIKey has been saved an showed.

![alt text](/assets/img/plugin_alert_apikey_intellijidea.png "Alert apikey")


## See the code in [IntelliJ IDEA PLUGIN](https://github.com/altixco/intellijidea-plugin)
