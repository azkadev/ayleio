<Div Align = "Center">

# Ayleio


[! [Dart] (https://img.shields.io/badge/dart-0175c2?style=for-the-badge&logo=dart&logocolor=white)] (https://dart.dev/)
[! [Flutter] (https://img.shields.io/badge/flutter-02569b
[! [License] (https://img.shields.io/badge/license-apache_2.0-blue.svg?style=for-the-badge)] (license)

*Play audio / video on the flutter*

[] (https://github.com/azkadev/ayleio/blob/main/asses/images/ayleio.jpg)


</div>

---


# Ayleio

** Ayleio ** Media Player for Flutter from Base Media Kit, I made this because the media kit can't build offline, so I make it

- 🇮🇩 [Indonesia] (https://github.com/azkadev/ayleio/blob/main/readme.md)
- 🇺🇸 [English] (https://github.com/azkadev/ayleio/blob/main/readme_en.md)
- 🇰🇷 [Korea, Republic of South Korea] (https://github.com/azkadev/ayleio/blob/main/readme_ko.md)
- 🇨🇳 [China] (https://github.com/azkadev/ayleio/blob/main/readme_zh-cn.md)
- 🇿🇦 [South Africa] (https://github.com/azkadev/ayleio/blob/main/readme_af.md)
- 🇮🇳 [India] (https://github.com/azkadev/ayleio/blob/main/readme_hi.md)
- 🇯🇵 [Japan] (https://github.com/azkadev/ayleio/blob/main/readme_ja.md)
- 🇷🇺 [russia] (https://github.com/azkadev/ayleio/blob/main/readme_ru.md)
- 🇹🇭 [Thailand] (https://github.com/azkadev/ayleio/blob/main/readme_th.md)
- 🇦🇪 [United Arab Emirates] (https://github.com/azkadev/ayleio/blob/main/readme_ar.md)


## Fact

- This library is not bound by many detensencens party 3

## Feature

- [x] ** Very fast ** Ashnc library (** does not block threads **)
- [x] ** Easy to use **

## Example


- [Full Stack Application] (https://github.com/azkadev/azkadev_fullstack_application_dart_and_flutter)
- [simple example] (https://github.com/azkadev/ayleio/tree/main/quickstart)


## Install

Before installing make sure you know the basic dart / flutter at least you have installed the flutter / dart on your computer / device. [Flutter Website] (https://flutter.dev)

- ** Dart / only CLI No GUI **
  If you want to use without a gui
  `` `Bash
  Dart Pub Add Ayleio
  `` `

- ** Flutter GUI **
  basically the same as Dart

  `` `Bash
  flutter pub add ayleio_flutter
  `` `

## Documentation


### Base

Make sure you make this basis first, don't have to be the same

**example:**

`` `Dart

Import "Package: ayleio/ayleio.dart";

void main () {
  print ("start");
  Final ayleioazkadev = ayleioazkadev ();
}

`` `

### ensureineinealized

The method must be called freely want to be after ** on ** / before the method ** on ** but I suggest before ** on **

**example:**

`` `Dart
  ayleioazkadev.ensureinitialized ();
`` `


### Initialized

This method must be called after the ** on ** method because to process updates

**example:**

`` `Dart
  ayleioazkadev.initialized ();
`` `

### On

This method is useful for getting data updates from invokes / updates

**example:**

`` `Dart
  ayleioazkadev.on ("update", (map update) async {
    print (update);
  });
`` `


### CreateClient

To create a new client, make sure you call the method.

**example:**

`` `Dart
Final Newclientid = ayleioazkadev.CreateClient ();
print ("new client id: $ {newclientid}");
`` `


### Invoke

To call the API you need to read the documentation directly

- [url docs] (other_url_docs) is easy to read for the public 

Here I only provide Parameters Data Map, Map / Json There are several important keys


| Key | Description | Value | MUST FILLED |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| **@type ** | This is filling with the method of | ** String ** | **yes**|
| **@client_id ** | It contains client ID from the ** CreateClient ** Method ** | ** Int ** | ** if for the sync method there must be something that is not ** |
| **@extra ** | Fill in the Unique ID because the ASYNC method does not return directly data so it needs extra as a key return data | ** String ** | ** No ** |


If we have filled the mandatory parameters, we continue how to invoke the fire

- ** Setlogveribilitylevel **
  because this is the log method, you use the sync method 
  and not required to fill in the key **@client_id **

  example: 


`` `Dart
  ayleioazkadev.invokesync ({
    "@type": "Setlogverability",
    "New_VeverBosity_Level": 0,
  });
`` `

- ** Sendmessage **
  To send messages using this library, make sure the client is logged in
  [Reference documentation of Sendmessage] (URL DOCS)

`` `Dart

        /// Take from createclient or update
        int client_id = 1;
        Final Getme = Ayleioazkadev.invoke ({{
          "@type": "getme",
          "@client_id": client_id,
        });
        print (getme);
        Await ayleioazkadev.invoke ({
          "@type": "Sendmessage",
          "@client_id": client_id,
          "chat_id": getme ["id"],
          "Type": "text",
          "Text": "Hello",
        });
`` `

Above that is only a little documentation if you want more samples, please check the example above

# Important

- All the programs that I made if I am in the official account I guarantee 100% safe no malware, no suspicious- is still confused why my code / no bis compile? We recommend that if you feel unhealthy check the doctor first, if you behave deviant, trans*ender, l*bt or other things, first medicine you are not my suspicious / malware program, I never do bad things like that, before you make other people go crazy / follow you, you better cure first. If you still want to keep learning my code, it seems impossible because I'm not a trans*ender, l*bt so maybe the program code will make it difficult for your brain
- If one day this program does not work, it needs to be remembered again I never made a Suspicous / Fake Malware / Code maybe because of time, it is important to understand the time this code is made and what version of the framework I use. Don't just accuse!, I can get out of control!
- Because it doesn't depend on a lot of dependencies even though my code is not updated, it is possible
- The program that I make basically does not depend on many dependencies
- If there are suspicious or different screenshots and readmes, believe me, I don't make malware, suspicious programs, maybe I'm lazy to update, you can make an issue to ask me to update / clarify

## Help

**Difficult**? I have built ** library ** this ** as well as possible ** maybe and ** try easy ** to read and ** used as best as possible **. 

if ** you ** still ** feel ** ** difficulty ** and ** confusion ** ** try to join ** to ** group ** we in ** free without any cost **

- [telegram] (https://t.me/developer_global_public)
- [discord] (https://discord.gg/h4qanyn7)

** Before joining ** Make sure ** use profile ** that ** clear ** we don't mind who you are, and any rank, but ** Make sure ** ** there is a username and photo profile **, and try to ** chat in the group ** ** no personal chat ** because it ** general group and maybe other people are confused **. If ** does not follow ** this is the possibility ** Cannot access chat in the group and will be banned **, the solution to use the second account, because after being banned we cannot respond quickly


## Support Me

If you feel this program is useful, you can support me [github azkadev] (https://github.com/azkadev) on the link is available social media and my sponsors. I don't mind if you only follow / donatea little money

[] (https://github.com/azkadev/azkadev/blob/main/asses/gopay.png)

- https://github.com/sponsors/azkadev
- https://www.patreon.com/c/azkadev
- https://openclective.com/azkadev
- https://paypal.me/azkadev

Thank You


AZKADEV-18-07-2025

-[Media Kit] (https://github.com/media-kit/media-kit)
  Actually this is the code from the media kit but some are changed, and this is 100% Support Build Offline


## Tags

- Ayleio Dart

</br>
</br>


<Div Align = "Center">

** Made as well as possible for Dart & Flutter Community **

</div>