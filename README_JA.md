<div align = "center">

＃ayleio


[！ [dart]（https://img.shields.io/badge/dart-0175c2？style=for-the-badge＆logo = dart&logocolor=white）]（https://dart.dev/）
[！ [フラッター]（https://img.shields.io/badge/flutter-02569b
[！ [ライセンス]（https://img.shields.io/badge/license-apache_2.0-blue.svg?style = for-the-badge）]（ライセンス）

*フラッターでオーディオ /ビデオを再生*

[]（https://github.com/azkadev/ayleio/blob/main/asses/images/ayleio.jpg）


</div>

---


＃ayleio

** ayleio **ベースメディアキットのフラッターのメディアプレーヤー、メディアキットがオフラインで構築できないのでこれを作りました。

-🇮🇩[インドネシア]（https://github.com/azkadev/ayleio/blob/main/readme.md）
-🇨🇿[アフリカ]（https://github.com/azkadev/ayleio/blob/main/readme_afrika.md）
-🇨🇳[中国]（https://github.com/azkadev/ayleio/blob/main/readme_china.md）
-🏴󠁧󠁢󠁥󠁮󠁧󠁿[英語]（https://github.com/azkadev/ayleio/blob/main/readme_english.md）
-🇮🇳[インド]（https://github.com/azkadev/ayleio/blob/main/readme_india.md）
-🇮🇩[java]（https://github.com/azkadev/ayleio/blob/main/readme_jawa.md）
-🇯🇵[日本語]（https://github.com/azkadev/ayleio/blob/main/readme_jepang.md）
-🇰🇷[韓国]（https://github.com/azkadev/ayleio/blob/main/readme_korea.md）
-🇷🇺[ロシア]（https://github.com/azkadev/ayleio/blob/main/readme_russia.md）
-🇮🇩[sundanese]（https://github.com/azkadev/ayleio/blob/main/readme_sunda.md）
-🇹🇭[タイ]（https://github.com/azkadev/ayleio/blob/main/readme_thailand.md）

＃＃ 事実

 - このライブラリは多くの精神障害者パーティーに縛られていません3

＃＃ 特徴

 -  [x] **非常に速い** ASHNCライブラリ（**スレッドをブロックしません**）
 -  [x] **使いやすい**

＃＃ 例


 -  [フルスタックアプリケーション]（https://github.com/azkadev/azkadev_fullstack_application_dart_and_flutter）
 -  [簡単な例]（https://github.com/azkadev/ayleio/tree/main/quickstart）


＃＃ インストール

インストールする前に、基本的なダーツ /フラッターを知っていることを確認してください。少なくともコンピューター /デバイスにフラッター /ダーツをインストールしてください。 [フラッターウェブサイト]（https://flutter.dev）

 -  ** dart / onlycli no gui **
  GUIなしで使用したい場合
  「バッシュ
  Dart Pub Add Ayleio
  `` `

 -  **フラッターgui **
  基本的にDARTと同じです

  「バッシュ
  フラッターパブはayleio_flutterを追加します
  `` `

##ドキュメント


###ベース

最初にこの基礎を作ることを確認してください、同じである必要はありません

**例：**

「ダート

インポート「パッケージ：ayleio/ayleio.dart ";

void main（）{
  print（ "start"）;
  final ayleioazkadev = ayleioazkadev（）;
}

`` `

### suresinealized

メソッドは自由に呼ばれなければなりません** on ** / method ** on **の後に** / **が** on **を提案します**

**例：**

「ダート
  ayleioazkadev.ensureInitialized（）;
`` `


###初期化

この方法は、更新を処理するために** on **メソッドの後に呼び出す必要があります

**例：**

「ダート
  ayleioazkadev.Initialized（）;
`` `

＃＃＃ の上

この方法は、Invoke / Updatesからデータの更新を取得するのに役立ちます

**例：**

「ダート
  ayleioazkadev.on（ "update"、（マップアップデート）async {
    print（update）;
  }）;
`` `


### CreateClient

新しいクライアントを作成するには、メソッドを呼び出すようにしてください。

**例：**

「ダート
final newClientId = ayleioazkadev.createclient（）;
print（ "新しいクライアントID：$ {newClientId}"）;
`` `


###呼び出し

APIを呼び出すには、ドキュメントを直接読む必要があります

 -  [url docs]（other_url_docs）が一般に読みやすいです 

ここでは、パラメータデータマップのみを提供します。マップ / jsonいくつかの重要なキーがあります


|キー|説明|値|満たさなければならない|
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| **@タイプ** |これはからの方法でいっぱいです| **文字列** | **はい** |
| **@client_id ** | ** createclient ** method **のクライアントIDが含まれています| ** int ** | **同期メソッドの場合は、**ではないものがなければなりません|
| **@extra ** | Asyncメソッドが直接データを返さないため、キーリターンデータとして追加が必要なため、一意のIDを入力してください| **文字列** | **いいえ** |


必須のパラメーターを埋めた場合、火災を呼び出す方法を続けます

 -  ** setLogverivivileLevel **
  これはログメソッドであるため、同期メソッドを使用します 
  キーに記入する必要はありません**@client_id **

  例： 


「ダート
  ayleioazkadev.invokesync（{
    「@Type」：「SetLogverability」、
    「New_Veverbosity_Level」：0
  }）;
`` `

 -  ** sendmessage **
  このライブラリを使用してメッセージを送信するには、クライアントがログインしていることを確認してください
  [sendmessageの参照ドキュメント]（url docs）

「ダート

        /// createClientまたは更新から取得します
        int client_id = 1;
        final getme = ayleioazkadev.invoke（{{
          「@Type」：「GetMe」、
          「@client_id」：client_id、
        }）;
        print（getMe）;
        ayleioazkadev.invokeを待っています（{
          「@type」：「sendmessage」、
          「@client_id」：client_id、
          「chat_id」：getme ["id"]、
          「タイプ」：「テキスト」、
          「テキスト」：「こんにちは」、
        }）;
`` `

上記は、サンプルを増やしたい場合はちょっとしたドキュメントです。上記の例を確認してください

＃ 重要

 - 私が作ったすべてのプログラムが公式アカウントにいる場合、マルウェアが100％安全でないことを保証します。疑わしいことはありません。最初に不健康な医師をチェックすることをお勧めします。逸脱している、トランス*エンダー、l*btまたは他のこと、最初の薬はあなたが私の疑わしい /マルウェアプログラムではない場合、私はそのような悪いことをしません。それでも私のコードを学び続けたい場合、私はトランス*エンダーではないので不可能に思えます。
 - ある日、このプログラムが機能しない場合、再び覚えておく必要があります。たぶん時間のために疑わしい /偽のマルウェア /コードを作成したことはありません。このコードが作られた時間と使用するフレームワークのバージョンを理解することが重要です。単に非難しないでください！、私は制御不能になることができます！
 - コードが更新されていない場合でも、多くの依存関係に依存しないため、可能です
 - 私が基本的に作成するプログラムは、多くの依存関係に依存しません
 - 疑わしいまたは異なるスクリーンショットやReadmesがある場合、私を信じてください、私はマルウェア、疑わしいプログラムを作成しません、多分私は更新するのが怠けているかもしれません、あなたは私に更新 /明確化するように頼むために問題を作ることができます

＃＃ ヘルプ

**難しい**？私は**ライブラリ**を作成しました**可能な限り**たぶん**簡単に試してみてください**読み取り、**可能な限り使用されます**。 

if ** you ** still ** feel ** **難易度**と**混乱** ** **から**グループ**私たちは**無料で無料** ** ** **

 -  [Telegram]（https://t.me/developer_global_public）
 -  [Discord]（https://discord.gg/h4qanyn7）

** **確認する前に**プロフィールを使用します**その**クリア**私たちはあなたが誰であるか、そして** ** **ユーザー名と写真プロファイル**があることを確認してください** ** ** **一般的なグループと他の人が混乱しているからです。 **に従わない場合**これは可能性**グループ内のチャットにアクセスできず、禁止されます** 2番目のアカウントを使用するソリューション、禁止された後、迅速に応答できないため


##私をサポートします

このプログラムが便利であると感じたら、[Github azkadev]（https://github.com/azkadev）をサポートできます。and my sponsor. I don't mind if you only follow / donate a little money

[]（https://github.com/azkadev/azkadev/blob/main/asses/gopay.png）

-https：//github.com/spons/azkadev
-https：//www.patreon.com/c/azkadev
- https://openclective.com/azkadev
-https：//paypal.me/azkadev

ありがとう


AZKADEV-18-07-2025

-[Media Kit] (https://github.com/media-kit/media-kit)
  Actually this is the code from the media kit but some are changed, and this is 100% Support Build Offline


## Tags

- Ayleio Dart

</br>
</br>


<div align = "center">

** Made as well as possible for Dart & Flutter Community **

</div>