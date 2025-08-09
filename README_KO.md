<div align = "center">

# Ayleio


[! [dart] (https://img.shields.io/badge/dart-0175c2?style=for-the-badge&logo=dart&logocolor=white)] (https://dart.dev/)
[! [플러터] (https://img.shields.io/badge/flutter-02569b
[! [라이센스] (https://img.shields.io/badge/license-apache_2.0-blue.svg?style=for-the-badge)] (라이센스)

*플러터에서 오디오 / 비디오 재생*

[] (https://github.com/azkadev/ayleio/blob/main/asses/images/ayleio.jpg)


</div>

---


# Ayleio

** Ayleio ** 기본 미디어 키트에서 Flut

- [인도네시아] (https://github.com/azkadev/ayleio/blob/main/readme.md)
- h [영어] (https://github.com/azkadev/ayleio/blob/main/readme_en.md)
- republic [한국, 한국 공화국] (https://github.com/azkadev/ayleio/blob/main/readme_ko.md)
- h [중국] (https://github.com/azkadev/ayleio/blob/main/readme_zh-cn.md)
- [남아프리카] (https://github.com/azkadev/ayleio/blob/main/readme_af.md)
- h [인도] (https://github.com/azkadev/ayleio/blob/main/readme_hi.md)
- h [일본] (https://github.com/azkadev/ayleio/blob/main/readme_ja.md)
- ([러시아] (https://github.com/azkadev/ayleio/blob/main/readme_ru.md)
- [태국] (https://github.com/azkadev/ayleio/blob/main/readme_th.md)
- ir [아랍 에미리트 항공] (https://github.com/azkadev/ayleio/blob/main/readme_ar.md)


## 사실

-이 도서관은 많은 Detensencens Party 3에 의해 구속되지 않습니다 3

## 특징

- [x] ** 매우 빠른 ** ASHNC 라이브러리 (**는 스레드를 차단하지 않습니다 **)
- [x] ** 사용하기 쉬움 **

## 예


- [전체 스택 애플리케이션] (https://github.com/azkadev/azkadev_fullstack_application_dart_and_flutter)
- [간단한 예] (https://github.com/azkadev/ayleio/tree/main/quickstart)


## 설치하다

설치하기 전에 최소한 기본 다트 / 플러터가 컴퓨터 / 장치에 Flutter / Dart를 설치했는지 확인하십시오. [Flutter 웹 사이트] (https://flutter.dev)

- ** 다트 / 유일한 cli no gui **
  GUI없이 사용하려는 경우
  ```Bash
  다트 펍 추가 ayleio
  ```

- ** Flutter Gui **
  기본적으로 다트와 동일합니다

  ```Bash
  Flutter Pub Add ayleio_flutter
  ```

## 문서


###베이스

이 근거를 먼저 만들 수 있습니다. 동일 할 필요는 없습니다.

**예:**

```다트

가져 오기 "패키지 : ayleio/ayleio.dart";

void main () {
  인쇄 ( "시작");
  최종 ayleioazkadev = ayleioazkadev ();
}

```

### 보장

이 방법은 ** On ** 이전 ** 전에 ** / on ** on ** on ** on **를 제안합니다.

**예:**

```다트
  ayleioazkadev.ensureinitialized ();
```


### 초기화

이 방법은 ** on ** 메소드 후에 호출되어야합니다.

**예:**

```다트
  ayleioazkadev.initialized ();
```

### 에

이 방법은 호출 / 업데이트에서 데이터 업데이트를 얻는 데 유용합니다.

**예:**

```다트
  ayleioazkadev.on ( "Update", (맵 업데이트) Async {
    인쇄 (업데이트);
  });
```


### createclient

새 클라이언트를 만들려면 메소드를 호출하십시오.

**예:**

```다트
최종 NewClientID = ayleioazkadev.createclient ();
print ( "새 클라이언트 ID : $ {newClientId}");
```


### 부르다

API를 호출하려면 문서를 직접 읽어야합니다.

- [URL DOCS] (Other_URL_DOCS)는 대중을 위해 쉽게 읽을 수 있습니다. 

여기서는 매개 변수 데이터 맵, Map / JSON 만 제공합니다. 몇 가지 중요한 키가 있습니다.


| 키 | 설명 | 가치 | 채워 져야 |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| **@type ** | 이것은 |의 방법으로 채워진다 ** 문자열 ** | **예**|
| **@client_id ** | ** CreateClient ** Method **의 클라이언트 ID가 포함되어 있습니다. ** int ** | ** 동기화 메소드의 경우 **가 아닌 것이 있어야합니다 |
| **@extra ** | Async 메소드가 직접 데이터를 반환하지 않으므로 주요 반환 데이터로 추가가 필요하기 때문에 고유 ID를 채우십시오 | ** 문자열 ** | ** 아니요 ** |


필수 매개 변수를 채우면 불을 부르는 방법을 계속합니다.

- ** setLogVeriblyLevel **
  로그 메소드이므로 Sync 메소드를 사용합니다. 
  키 **@client_id **를 채울 필요가 없습니다.

  예: 


```다트
  ayleioazkadev.invokesync ({
    "@type": "setLogVerability",
    "new_veverbosity_level": 0,
  });
```

- ** SendMessage **
  이 라이브러리를 사용하여 메시지를 보내려면 클라이언트가 로그인했는지 확인하십시오.
  [SendMessage의 참조 문서] (URL 문서)

```다트

        /// CreateClient에서 가져 오거나 업데이트하십시오
        int client_id = 1;
        최종 getme = ayleioazkadev.invoke ({{
          "@type": "getme",
          "@client_id": client_id,
        });
        인쇄 (getme);
        Ayleioazkadev.invoke를 기다리고 있습니다 ({{
          "@type": "sendmessage",
          "@client_id": client_id,
          "chat_id": getme [ "id"],
          "유형": "텍스트",
          "텍스트": "안녕하세요",
        });
```

그 위에는 더 많은 샘플을 원한다면 작은 문서입니다. 위의 예를 확인하십시오.

# 중요한

- 공식 계정에 있다면 내가 만든 모든 프로그램은 100% 안전한 맬웨어가 없음을 보장합니다. 건강에 해로운 느낌이 들면 의사를 먼저 점검하고, 이탈자, 트랜스*엔더, l*bt 또는 다른 것들, 첫 번째 약은 내 의심스러운 / 악성 코드 프로그램이 아닙니다. 나는 그런 나쁜 일을하지 않습니다. 다른 사람들이 당신을 미치게 만들기 전에, 당신은 먼저 치료를 더 잘 치료할 것을 더 잘 치료하는 것이 좋습니다. 여전히 내 코드를 계속 배우고 싶다면 트랜스*엔더가 아니기 때문에 불가능 해 보입니다.
- 언젠가이 프로그램이 작동하지 않으면 다시 기억해야합니다. 시간 때문에 의심스러운 / 가짜 맬웨어 / 코드를 만들지 않았 으므로이 코드가 만들어지는 시간과 내가 사용하는 프레임 워크의 버전을 이해하는 것이 중요합니다. 단지 비난하지 마십시오!, 나는 통제 불능 상태를 얻을 수 있습니다!
- 내 코드가 업데이트되지 않더라도 많은 종속성에 의존하지 않기 때문에 가능합니다.
- 내가 기본적으로 만드는 프로그램은 많은 종속성에 의존하지 않습니다.
- 의심 스럽거나 다른 스크린 샷과 readmes가 있다면, 저를 믿으십시오. 나는 맬웨어를 만들지 않고 의심스러운 프로그램을 만들지 않을 것입니다.

## 돕다

**어려운**? 나는 ** 라이브러리 **이 **를 만들었습니다. 

만약 ** 당신이 ** 여전히 ** 느낌 ** ** 난이도 ** 및 ** 혼란 ** ** ** ** 그룹 **에 가입하려고 ** 우리는 ** 비용없이 ** 무료 **

- [전보] (https://t.me/developer_global_public)
- [discord] (https://discord.gg/h4qanyn7)

**에 가입하기 전에 ** 분명한 **를 사용하십시오 ** 명확한 ** 우리는 당신이 누구인지, 어떤 계급도 신경 쓰지 않지만 ** ** 사용자 이름과 사진 프로필 **가 있는지 확인하십시오 ** 그룹에서 ** 개인 채팅 ** 일반 그룹과 다른 사람들이 혼란을 겪기 때문에 ** 개인 채팅 ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 개인 채팅 **. **가 따르지 않는 경우 ** 이것은 가능성입니다 **는 그룹의 채팅에 액세스 할 수 없으며 금지 될 것입니다 **, 두 번째 계정을 사용하는 솔루션입니다. 금지 된 후에는 신속하게 응답 할 수 없기 때문입니다.


## 나를 지원합니다

이 프로그램이 유용하다고 생각되면 링크에서 [Github Azkadev] (https://github.com/azkadev)를 지원할 수 있습니다. 당신이 팔로우 / 기부 만해도 괜찮습니다약간의 돈

[] (https://github.com/azkadev/azkadev/blob/main/asses/gopay.png)

-https://github.com/sponsors/azkadev
-https://www.patreon.com/c/azkadev
-https://openclective.com/azkadev
-https://paypal.me/azkadev

감사합니다


Azkadev-18-07-2025

-[미디어 키트] (https://github.com/media-kit/media-kit)
  실제로 이것은 미디어 키트의 코드이지만 일부는 변경되었으며 100% 지원 빌드 오프라인입니다.


## 태그

-Ayleio 다트

</br>
</br>


<div align = "center">

** Dart & Flutter Community를 위해 가능한 한 만들어졌습니다 **

</div>