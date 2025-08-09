<Div align = "center">

# Ayleio


[! [Dart] (https://img.shields.io/badge/dart-0175c2?style=for-the-badge&logo=dart&logocolor=white)]] (https://dart.dev/)
[! [Flutter] (https://img.shields.io/badge/flutter-02569b
[! ]

*Speel klank / video op die fladder*

[] (https://github.com/azkadev/ayleio/blob/main/asses/images/ayleio.jpg)


</div>

---


# Ayleio

** ayleio ** mediaspeler vir fladder uit die basismedia -kit, ek het dit gemaak omdat die mediakit nie vanlyn kan opbou nie, so ek maak dit

- 🇮🇩 [Indonesië] (https://github.com/azkadev/ayleio/blob/main/readme.md)
- 🇺🇸 [Engels] (https://github.com/azkadev/ayleio/blob/main/readme_en.md)
- 🇰🇷 [Korea, Republiek van Suid -Korea] (https://github.com/azkadev/ayleio/blob/main/readme_ko.md)
- 🇨🇳 [China] (https://github.com/azkadev/ayleio/blob/main/readme_zh-cn.md)
- 🇿🇦 [Suid -Afrika] (https://github.com/azkadev/ayleio/blob/main/readme_af.md)
- 🇮🇳 [Indië] (https://github.com/azkadev/ayleio/blob/main/readme_hi.md)
- 🇯🇵 [Japan] (https://github.com/azkadev/ayleio/blob/main/readme_ja.md)
- 🇷🇺 [Rusland] (https://github.com/azkadev/ayleio/blob/main/readme_ru.md)
- 🇹🇭 [Thailand] (https://github.com/azkadev/ayleio/blob/main/readme_th.md)
- 🇦🇪 [Verenigde Arabiese Emirate] (https://github.com/azkadev/ayleio/blob/main/readme_ar.md)


## feit

- Hierdie biblioteek is nie gebind deur baie opneempartytjie 3 nie

## funksie

- [x] ** baie vinnig ** ashnc -biblioteek (** blokkeer nie drade **)
- [x] ** maklik om te gebruik **

## Voorbeeld


- [Full Stack -toepassing] (https://github.com/azkadev/azkadev_fullstack_application_dart_and_flutter)
- [Eenvoudige voorbeeld] (https://github.com/azkadev/ayleio/tree/main/quickstart)


## Installeer

Voordat u installeer, moet u seker maak dat u die basiese pyltjie / fladder ken ten minste, u het die fladder / pyl op u rekenaar / toestel geïnstalleer. [Flutter webwerf] (https://flutter.dev)

- ** dart / slegs cli no gui **
  As u wil gebruik sonder 'n GUI
  `` Bash
  Dart Pub voeg Ayleio by
  `` `

- ** fladder gui **
  basies dieselfde as Dart

  `` Bash
  fladder kroeg voeg Ayleio_flutter by
  `` `

## dokumentasie


### basis

Maak seker dat u hierdie basis eers maak, hoef nie dieselfde te wees nie

** Voorbeeld: **

`` `Dart

Invoer "Pakket: Ayleio/Ayleio.dart";

nietig hoof () {
  druk ("begin");
  Finale ayleioazkadev = ayleioazkadev ();
}

`` `

### Versekeryninaliseer

Die metode moet vrylik genoem word om na ** op ** / voor die metode ** op ** te wees, maar ek stel voor ** op **

** Voorbeeld: **

`` `Dart
  ayleioazkadev.ensureInitialized ();
`` `


### Initialiseer

Hierdie metode moet na die ** op ** -metode geroep word, want om opdaterings te verwerk

** Voorbeeld: **

`` `Dart
  ayleioazkadev.initialized ();
`` `

### aan

Hierdie metode is nuttig om data -opdaterings van oproepe / opdaterings te kry

** Voorbeeld: **

`` `Dart
  ayleioazkadev.on ("update", (kaartopdatering) async {
    druk (opdatering);
  });
`` `


### createclient

Om 'n nuwe kliënt te skep, maak seker dat u die metode noem.

** Voorbeeld: **

`` `Dart
Finale newClientId = ayleIOazkadev.createClient ();
druk ("nuwe kliënt -ID: $ {newClientId}");
`` `


### Invok

Om die API te skakel, moet u die dokumentasie direk lees

- [URL Docs] (ander_url_docs) is maklik om vir die publiek te lees 

Hier bied ek slegs parameters datakaart, kaart / json Daar is verskeie belangrike sleutels


| Sleutel | Beskrywing | Waarde | Moet gevul word |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| **@tipe ** | Dit is gevul met die metode van | ** String ** | ** Ja **|
| **@client_id ** | Dit bevat kliënt -ID vanaf die ** createClient ** -metode ** | ** int ** | ** As daar vir die sinkroniseringsmetode iets moet wees wat nie ** |
| **@ekstra ** | Vul die unieke ID in omdat die async -metode nie direk data teruggee nie, sodat dit ekstra nodig is as 'n sleutelopgawe -data | ** String ** | ** nee ** |


As ons die verpligte parameters gevul het, gaan ons voort hoe om die brand aan te roep

- ** setLogveribilityLevel **
  Omdat dit die log -metode is, gebruik u die sinkroniseringsmetode 
  en nie hoef te vul om die sleutel in te vul nie **@client_id **

  Voorbeeld: 


`` `Dart
  ayleioazkadev.invokesync ({
    "@Type": "setLogverability",
    "New_veverbosity_level": 0,
  });
`` `

- ** sendMessage **
  Maak seker dat die kliënt aangemeld is om boodskappe met hierdie biblioteek te stuur
  [Verwysingsdokumentasie van SendMessage] (URL -dokumente)

`` `Dart

        /// Neem vanaf CreateClient of Update
        int client_id = 1;
        Finale getMe = AyleIOazKadev.invoke ({{
          "@Type": "getMe",
          "@client_id": client_id,
        });
        druk (getMe);
        Wag op ayleioazkadev.invoke ({
          "@Type": "sendMessage",
          "@client_id": client_id,
          "chat_id": getMe ["id"],
          "Tipe": "teks",
          "Teks": "Hallo",
        });
`` `

Hierbo is slegs 'n bietjie dokumentasie as u meer monsters wil hê, kyk na die voorbeeld hierbo

# Belangrik

- al die programme wat ek gemaak het as ek in die amptelike rekening is, waarborg ek 100% veilig, geen malware nie, geen agterdogtig nie- is nog steeds verward waarom my kode / geen bis samestelling is nie? Ons beveel aan dat as u ongesond voel na die dokter, as u afwykend optree, trans*ender, l*bt of ander dinge, eerste medisyne, is u nie my verdagte / malware -program nie, ek doen nooit slegte dinge soos dit nie, voordat u ander mense mal maak / u volg, moet u eers eers genees. As u nog steeds wil aanhou om my kode te leer, lyk dit onmoontlik, want ek is nie 'n trans*enter nie, l*bt, so miskien sal die programkode dit vir u brein moeilik maak
- As hierdie program eendag nie werk nie, moet ek weer onthou word, ek het nooit 'n verdagte / vals malware / kode gemaak nie, miskien is dit belangrik om die tyd wat hierdie kode gemaak is, te verstaan en watter weergawe van die raamwerk ek gebruik. Moenie net beskuldig nie!, Ek kan buite beheer raak!
- Omdat dit nie van baie afhanklikhede afhang nie, alhoewel my kode nie opgedateer word nie, is dit moontlik
- Die program wat ek maak, hang nie van baie afhanklikhede af nie
- As daar verdagte of verskillende skermkiekies en herbepalings is, glo my, ek maak nie malware, verdagte programme nie, miskien is ek lui om op te dateer, kan u 'n probleem maak om my te vra om op te dateer / duidelik te maak

## Help

** Moeilik **? Ek het ** biblioteek ** hierdie ** so goed as moontlik ** gebou en ** probeer maklik ** om te lees en ** so goed as moontlik gebruik **. 

As ** jy ** nog steeds ** voel ** ** Moeilikheid ** en ** Verwarring ** ** Probeer om aan te sluit ** tot ** Groep ** Ons in ** gratis sonder enige koste **

- [Telegram] (https://t.me/developer_global_public)
- [Discord] (https://discord.gg/h4qanyn7)

** Voordat u aansluit ** maak seker ** Gebruik profiel ** dat ** duidelik ** Ons gee nie om wie u is nie, en enige rang, maar ** Maak seker dat daar 'n gebruikersnaam en fotoprofiel is **, en probeer om ** in die groep te gesels ** ** Geen persoonlike klets ** want dit ** General Group en miskien is ander mense verward **. As ** nie volg nie **, is dit die moontlikheid ** kan nie toegang hê tot die klets in die groep nie en sal dit verbied word **, die oplossing om die tweede rekening te gebruik, want nadat ons verbied is, kan ons nie vinnig reageer nie


## Ondersteun my

As u voel dat hierdie program nuttig is, kan u my [GitHub Azkadev] (https://github.com/azkadev) op die skakel ondersteun, is beskikbaar op sosiale media en my borge. Ek gee nie om as u net volg / skenk nie'n bietjie geld

[] (https://github.com/azkadev/azkadev/blob/main/asses/gopay.png)

- https://github.com/sponsors/azkadev
- https://www.patreon.com/c/azkadev
- https://openclective.com/azkadev
- https://paypal.me/azkadev

Dankie


Azkadev-18-07-2025

-[Media Kit] (https://github.com/media-kit/media-kit)
  Eintlik is dit die kode van die Media Kit, maar sommige word verander, en dit is 100% ondersteuningsopbou vanlyn


## Tags

- Ayleio Dart

</br>
</br>


<Div align = "center">

** Gemaak so goed as moontlik vir Dart & Flutter Community **

</div>