<div align="center">

# Ayleio


[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=for-the-badge)](LICENSE)

*{short_description}*

![](https://github.com/azkadev/ayleio/blob/main/assets/images/ayleio.jpg)


</div>

---


# Ayleio

**Ayleio** {description}

- 🇮🇩 [Indonesia](https://github.com/azkadev/ayleio/blob/main/README.md)
- 🇨🇿 [Afrika](https://github.com/azkadev/ayleio/blob/main/README_AFRIKA.md)
- 🇨🇳 [China](https://github.com/azkadev/ayleio/blob/main/README_CHINA.md)
- 🏴󠁧󠁢󠁥󠁮󠁧󠁿 [English](https://github.com/azkadev/ayleio/blob/main/README_ENGLISH.md)
- 🇮🇳 [India](https://github.com/azkadev/ayleio/blob/main/README_INDIA.md)
- 🇮🇩 [Jawa](https://github.com/azkadev/ayleio/blob/main/README_JAWA.md)
- 🇯🇵 [Jepang](https://github.com/azkadev/ayleio/blob/main/README_JEPANG.md)
- 🇰🇷 [Korea](https://github.com/azkadev/ayleio/blob/main/README_KOREA.md)
- 🇷🇺 [Russia](https://github.com/azkadev/ayleio/blob/main/README_RUSSIA.md)
- 🇮🇩 [Sunda](https://github.com/azkadev/ayleio/blob/main/README_SUNDA.md)
- 🇹🇭 [Thailand](https://github.com/azkadev/ayleio/blob/main/README_THAILAND.md)

## Fakta

- Library ini tidak terikat banyak depenencides pihak 3

## Feature

- [x] **Sangat Cepat** Library Async (**Tidak Memblokir Threads**)
- [x] **Mudah Digunakan**

## Contoh

- [Contoh Sederhana](https://github.com/azkadev/ayleio/tree/main/quickstart)



## Memasang

sebelum memasang pastikan kamu mengetahui basic dart / flutter setidaknya kamu sudah menginstall flutter / dart dalam komputer / device kamu. [Flutter Website](https://flutter.dev)

- **Dart / Hanya Cli Tidak ada gui**
  jika kamu ingin menggunakan tanpa gui
  ```bash
  dart pub add ayleio
  ```

- **Flutter gui**
  pada dasarnya sama seperti dart

  ```bash
  flutter pub add ayleio_flutter
  ```

## Dokumentasi


### Dasar

pastikan kamu membuat dasar ini dahulu ya, tidak harus sama

**contoh:**

```dart

import "package:ayleio/ayleio.dart";

void main() {
  print("start");
  final ayleioAzkadev = AyleioAzkadev();
}

```

### EnsureInitialized

method wajib di panggil bebas mau setelah **on** / sebelum method **on** tapi saya sarankan sebelum **on**

**contoh:**

```dart
  ayleioAzkadev.ensureInitialized();
```


### Initialized

method ini wajib di panggil setelah method **on** karena untuk mengolah update

**contoh:**

```dart
  await ayleioAzkadev.initialized();
```

### On

method on ini berguna untuk mendapatkan update data dari invoke / update

**contoh:**

```dart
  ayleioAzkadev.on("update", (Map update) async {
    print(update);
  });
```


### createClient

untuk membuat client baru pastikan kamu memanggil method.

**contoh:**

```dart
final newClientId = ayleioAzkadev.createClient();
print("New Client Id: ${newClientId}");
```


### Invoke

untuk memanggil api kamu perlu membaca dokumentasi langsung

- [Url Docs](other_url_docs) mudah di baca untuk umum 

disini saya hanya menyediakan parameters data map, map / json ini terdapat beberapa key penting


| Key            | Description                                                                                                    | Value      | Wajib Diisi                                              |
|----------------|----------------------------------------------------------------------------------------------------------------|------------|----------------------------------------------------------|
| **@type**      | ini isi dengan method dari                                                                              | **String** | **ya**                                                   |
| **@client_id** | ini berisi client id dari method **createClient**                                                              | **int**    | **jika untuk method sync ada yang wajib ada yang tidak** |
| **@extra**     | isi dengan unique id karena method async tidak return data langsung jadi perlu extra sebagai kunci return data | **String** | **Tidak**                                                |


jika sudah mengisi parameters wajib, kita lanjut bagaimana menginvoke api

- **SetLogVerbosityLevel**
  di karenakan ini method log maka kamu menggunakan method sync 
  dan tidak wajib mengisi key **@client_id**

  contoh: 


```dart
  ayleioAzkadev.invokeSync({
    "@type": "setLogVerbosityLevel",
    "new_verbosity_level": 0,
  });
```

- **SendMessage**
  untuk mengirim pesan menggunakan library ini pastikan client sudah login
  [Referensi Dokumentasi SendMessage](url docs)

```dart

        /// ambil from createClient atau pembaruan
        int client_id = 1;
        final getMe = await ayleioAzkadev.invoke({
          "@type": "getMe",
          "@client_id": client_id,
        });
        print(getMe);
        await ayleioAzkadev.invoke({
          "@type": "sendMessage",
          "@client_id": client_id,
          "chat_id": getMe["id"],
          "type": "text",
          "text": "Hello",
        });
```

di atas itu hanyalah contoh, untuk menggunakan method lain isi saja data parameters, pastikan parameters key wajib di isi sesuai table, maksud saya ada beberapa key yang wajib di isi, jika tidak ya akan mengirim data error


# Penting

- semua program yang saya buat jika ada di official akun saya saya jamin 100% aman no malware, no suspicious- masih bingung kenapa kode saya / tidak bis compile? sebaiknya jika kamu merasa tidak sehat check dahulu ke dokter, jika kamu berperilaku menyimpang, trans*ender, l*bt atau hal lainya, obatin dahulu kamu sendiri itu bukan program saya yang suspicious / malware, saya tidak pernah melakukan hal buruk seperti itu, sebelum kamu membuat orang lain menjadi gila / mengikuti kamu, lebih baik kamu obatin dulu ya. jika masih ingin tetap mempelajari code saya, rasanya tidak mungkin karena saya bukan seorang trans*ender, l*bt jadi mungkin code program akan menyulitkan otak kamu
- jika suatu saat program ini tidak berjalan perlu di ingat lagi saya tidak pernah membuat malware / code suspicous / fake mungkin karena waktu, penting memahami waktu code ini di buat dan framework yang saya pakai versi berapa. jangan asal menuduh!, saya bisa lepas kendali!
- di karenakan tidak bergantung banyak dependencies walaupun code saya tidak ada yang update kemungkinan masih bisa di pakai selama bahasa code program tidak mengalami perubahaan besar
- program yang saya buat pada dasarnya tidak bergantung banyak dependencies
- jika screenshot dan readme ada yang mencurigakan atau berbeda, percayalah saya tidak membuat program malware, suspicious, kemungkinan saya malas mengupdate, kamu bisa membuat issue untuk meminta saya update / berklarifikasi

## Bantuan

**Sulit**? saya sudah membangun **library** ini **sebaik** mungkin dan **berusaha mudah** di baca dan **digunakan sebaik mungkin**. 

jika **kamu** masih **merasa** **kesulitan** dan **kebingungan** **cobalah bergabung** ke **group** kami secara **gratis tanpa biaya apapun**

- [Telegram](https://t.me/DEVELOPER_GLOBAL_PUBLIC)
- [Discord](https://discord.gg/h4qanyN7)

**sebelum join** pastikan **memakai profile** yang **jelas** kami tidak keberatan kamu siapa, dan pangkat apapun, tapi **pastikan** **ada username dan photo profile**, dan usahakan untuk **chat di group** **tidak chat pribadi** karena itu **group umum dan mungkin orang lain kebingungan**. jika **tidak mengikuti** ini kemungkinan **tidak bisa akses chat di group dan bakal di banned**, solusi pakai akun kedua, karena setelah di banned kami tidak bisa merespond cepat


## Support Me

Jika kamu merasa program ini berguna, kamu bisa support saya [GITHUB azkadev](https://github.com/azkadev) di link itu tersedia social media dan sponsor saya. saya tidak keberatan jika kamu hanya follow / donasi uang sedikit

![](https://github.com/azkadev/azkadev/blob/main/assets/gopay.png)

- https://github.com/sponsors/azkadev
- https://www.patreon.com/c/azkadev
- https://opencollective.com/azkadev
- https://paypal.me/azkadev

Terimakasih


azkadev - 18-07-2025


## Tags

- ayleio dart

</br>
</br>


<div align="center">

**Di buat dengan sebaik mungkin untuk Dart & Flutter Komunitas**

</div>
