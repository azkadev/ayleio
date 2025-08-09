<div align =“中心”>

＃AYLEIO


[！ [dart]（https://img.shields.io/badge/dart-0175c2?style= for-the-badge&logo=dart&logoColor=white）]（https://dart.dev/）
[！ [flutter]（https://img.shields.io/badge/flutter-02569b
[！ [许可]（https://img.shields.io/badge/license-apache_2.0-blue.svg?style= for-the-badge）]（许可证）

*在颤音上播放音频 /视频*

[]（https://github.com/azkadev/ayleio/blob/main/asses/images/amages/ayleio.jpg）


</div>

---


＃AYLEIO

** Ayleio **媒体播放器从基本媒体套件中扑来，我之所以这样做，是因为媒体套件无法离线构建，所以我做到了

 - 🇮🇩[印度尼西亚]（https://github.com/azkadev/ayleio/blob/main/main/readme.md）
 - 🇨🇿[非洲]（https://github.com/azkadev/ayleio/blob/main/main/readme_afrika.md）
 - 🇨🇳[中国]（https://github.com/azkadev/ayleio/blob/main/main/readme_china.md）
 - 🏴󠁧󠁢󠁥󠁮󠁧󠁿[英语]（https://github.com/azkadev/ayleio/blob/main/main/readme_english.md）
 - 🇮🇳[印度]（https://github.com/azkadev/ayleio/blob/main/main/readme_india.md）
 - 🇮🇩[java]（https://github.com/azkadev/ayleio/blob/main/main/readme_jawa.md）
 - 🇯🇵[日本]（https://github.com/azkadev/ayleio/blob/main/main/readme_jepang.md）
 - 🇰🇷[韩国]（https://github.com/azkadev/ayleio/blob/main/main/readme_korea.md）
 - 🇷🇺[俄罗斯]（https://github.com/azkadev/ayleio/blob/main/main/readme_russia.md）
 - 🇮🇩[Sundanese]（https://github.com/azkadev/ayleio/blob/main/main/readme_sunda.md）
 - 🇹🇭[泰国]（https://github.com/azkadev/ayleio/blob/main/main/readme_thailand.md）

＃＃ 事实

 - 该图书馆不受许多Detensencens党的约束3

＃＃ 特征

 -  [x] **非常快** ashnc库（**不阻止线程**）
 -  [x] **易于使用**

＃＃ 例子


 -  [完整堆栈应用程序]（https://github.com/azkadev/azkadev_fullstack_application_dart_and_flutter）
 -  [简单示例]（https://github.com/azkadev/ayleio/tree/main/quickstart）


＃＃ 安装

在安装之前，请确保您知道基本的飞镖 /扑动，至少您已经在计算机 /设备上安装了颤动 /飞镖。 [Flutter网站]（https://flutter.dev）

 -  **飞镖 /只有cli no gui **
  如果您想不用GUI使用
  ``bash
  Dart Pub添加Ayleio
  ````````

 -  ** flutter gui **
  基本上与DART相同

  ``bash
  Flutter Pub添加Ayleio_flutter
  ````````

##文档


＃＃＃ 根据

确保您首先制定此基础，不必是相同的

**例子：**

``飞镖

导入“软件包：Ayleio/Ayleio.dart”；

void main（）{
  打印（“ start”）;
  最后的Ayleioazkadev = Ayleioaazkadev（）;
}

````````

###确保我化

必须自由地称呼该方法在**之前** / **之前的**，但我建议在**上**之前**

**例子：**

``飞镖
  ayleioazkadev.sureinitialized（）;
````````


###初始化

必须以**方法的**来调用此方法，因为要处理更新

**例子：**

``飞镖
  Ayleioazkadev.Initialized（）;
````````

＃＃＃ 在

此方法对于从invokes /更新获取数据更新很有用

**例子：**

``飞镖
  Ayleioazkadev.on（“ Update”，（MAP UPDATE）ASYNC {
    打印（更新）;
  }）;
````````


### createClient

要创建一个新客户，请确保调用该方法。

**例子：**

``飞镖
final newClientId = Ayleioazkadev.CreateClient（）;
print（“新客户ID：$ {newClientId}”）;
````````


### Invoke

要拨打API，您需要直接阅读文档

 -  [url docs]（其他_url_docs）很容易阅读公众 

在这里，我仅提供参数数据图，地图 / json有几个重要的键


|键|描述|值|必须填写|
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| **@type ** |这填充了来自| **字符串** | **是** |
| **@client_id ** |它包含来自** createClient **方法** |的客户端ID。 ** int ** | **如果用于同步方法，则必须没有** |
| **@extra ** |填写唯一ID，因为异步方法没有直接返回数据，因此需要额外作为键返回数据| **字符串** | **否** |


如果我们填写了强制性参数，我们将继续如何调用火

 -  ** setLogibilitylevel **
  因为这是日志方法，所以您使用同步方法 
  并且不需要填写密钥**@client_id **

  例子： 


``飞镖
  Ayleioazkadev.invokesync（{
    “ @Type”：“ setLogverability”，
    “ new_veverbosity_level”：0，
  }）;
````````

 -  ** sendmessage **
  要使用此库发送消息，请确保客户端已登录
  [sendmessage的参考文档]（URL文档）

``飞镖

        ///从CreateClient或更新
        int client_id = 1;
        final getme = ayleioazkadev.invoke（{{{{
          “ @Type”：“ GetMe”，
          “ @client_id”：client_id，
        }）;
        打印（getme）;
        等待ayleioazkadev.invoke（{
          “ @Type”：“ sendmessage”，
          “ @client_id”：client_id，
          “ chat_id”：getme [“ id”]，
          “ type”：“ text”，
          “文字”：“你好”，
        }）;
````````

上面只是一些文档，如果您想要更多样本，请检查上面的示例

＃ 重要的

 - 如果我在官方帐户中我制定的所有程序，我保证100％安全没有恶意软件，没有可疑的 - 仍然感到困惑为什么我的代码 /没有bis编译？我们建议，如果您先检查医生不健康，如果您表现不佳，trans*ender*ender，l*bt或其他东西，第一种药物，您不是我的可疑 /恶意软件程序，我永远不会做这样的坏事，在您让其他人发疯 /关注您之前，您最好先治疗。如果您仍然想继续学习我的代码，那似乎是不可能的
 - 如果有一天该程序不起作用，则需要再次记住它，我从来没有因为时间而制作了可疑 /假的恶意软件 /代码，重要的是要了解该代码的时间以及我使用的框架的哪个版本。不要只是指责！我可以失去控制！
 - 因为即使我的代码没有更新，它也不取决于很多依赖项，所以可能
 - 我基本上制定的程序并不取决于许多依赖关系
 - 如果有可疑或不同的屏幕截图和阅读件，请相信我，我不制作恶意软件，可疑程序，也许我很懒惰，您可以提出问题，要求我更新 /澄清

＃＃ 帮助

**难的**？我已经建立了**库**这个**，也许**可能会尝试阅读和**尽可能多地使用** **。 

如果**您**仍然**感觉** **困难**和**混乱** **尝试加入**与**组**我们无需任何费用**

 -  [Telegram]（https://t.me/developer_global_public）
 -  [discord]（https://discord.gg/h4qanyn7）

**加入** **请确保使用个人资料** **清晰**我们不介意您是谁，任何等级，但是** ** ** ** ** **有一个用户名和照片配置文件**，然后尝试**在组中**聊天** **没有个人聊天** ** ** **，因为它**是**一般组和其他人和其他人感到困惑**。如果**不遵循**这是可能性**无法访问组中的聊天，并且将被禁止**，这是使用第二个帐户的解决方案，因为被禁止后，我们无法快速响应


##支持我

如果您认为此程序很有用，则可以在可用的社交媒体上支持我[Github Azkadev]（https://github.com/azkadev）还有我的赞助商。我不介意您是否只关注 /捐赠一点钱

[]（https://github.com/azkadev/azkadev/blob/main/asses/gopay.png）

-https：//github.com/sponsors/azkadev
-https：//www.patreon.com/c/azkadev
-https：//openclective.com/azkadev
-https：//paypal.me/azkadev

谢谢


AZKADEV-18-07-2025

 -  [媒体套件]（https://github.com/media-kit/media-kit）
  实际上，这是媒体套件的代码


##标签

-Ayleio Dart

</br>
</br>


<div align =“中心”>

**为飞镖和扑面社区做得尽可能多地**

</div>