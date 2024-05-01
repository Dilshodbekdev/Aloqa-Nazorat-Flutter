// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Aloqa nazorat`
  String get app_name {
    return Intl.message(
      'Aloqa nazorat',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Телефон номер`
  String get phone_number {
    return Intl.message(
      'Телефон номер',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Рўйхатдан ўтиш`
  String get register {
    return Intl.message(
      'Рўйхатдан ўтиш',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Исм`
  String get name {
    return Intl.message(
      'Исм',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get surname {
    return Intl.message(
      'Фамилия',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Шарифи`
  String get mid_name {
    return Intl.message(
      'Шарифи',
      name: 'mid_name',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Ўзкомназорат инспекцияси`
  String get uz_com {
    return Intl.message(
      'Ўзкомназорат инспекцияси',
      name: 'uz_com',
      desc: '',
      args: [],
    );
  }

  /// `O'zbek`
  String get oz {
    return Intl.message(
      'O\'zbek',
      name: 'oz',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get ru {
    return Intl.message(
      'Русский',
      name: 'ru',
      desc: '',
      args: [],
    );
  }

  /// `Кейинги`
  String get next {
    return Intl.message(
      'Кейинги',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Рўйхатдан ўтинг`
  String get intro_title_1 {
    return Intl.message(
      'Рўйхатдан ўтинг',
      name: 'intro_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Мобиль иловадан фойдаланиш учун авторизациядан ўтинг ёки мавжуд профилингиз орқали тизимга киринг`
  String get intro_desc_1 {
    return Intl.message(
      'Мобиль иловадан фойдаланиш учун авторизациядан ўтинг ёки мавжуд профилингиз орқали тизимга киринг',
      name: 'intro_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Муаммо бўйича хабар беринг`
  String get intro_title_2 {
    return Intl.message(
      'Муаммо бўйича хабар беринг',
      name: 'intro_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Ахборотлаштириш ва телекоммуникациялар соҳасида мавжуд муаммолар ҳақида хабар беринг`
  String get intro_desc_2 {
    return Intl.message(
      'Ахборотлаштириш ва телекоммуникациялар соҳасида мавжуд муаммолар ҳақида хабар беринг',
      name: 'intro_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Муаммо ечилиши бўйича натижани кутинг`
  String get intro_title_3 {
    return Intl.message(
      'Муаммо ечилиши бўйича натижани кутинг',
      name: 'intro_title_3',
      desc: '',
      args: [],
    );
  }

  /// `"Ўзкомназорат" инспекцияси томонидан муаммо ва мурожаатингиз бўйича расмий жавоб берилишини кутинг`
  String get intro_desc_3 {
    return Intl.message(
      '"Ўзкомназорат" инспекцияси томонидан муаммо ва мурожаатингиз бўйича расмий жавоб берилишини кутинг',
      name: 'intro_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `натижани кўринг`
  String get intro_title_4 {
    return Intl.message(
      'натижани кўринг',
      name: 'intro_title_4',
      desc: '',
      args: [],
    );
  }

  /// `Сизнинг муаммоингиз ҳал этилиши бўйича натижа билан танишинг ва тизимга ўз баҳоингизни қўйинг`
  String get intro_desc_4 {
    return Intl.message(
      'Сизнинг муаммоингиз ҳал этилиши бўйича натижа билан танишинг ва тизимга ўз баҳоингизни қўйинг',
      name: 'intro_desc_4',
      desc: '',
      args: [],
    );
  }

  /// `Асосий`
  String get main {
    return Intl.message(
      'Асосий',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаатлар`
  String get references {
    return Intl.message(
      'Мурожаатлар',
      name: 'references',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Паролни унутдингизми?`
  String get forgot_password {
    return Intl.message(
      'Паролни унутдингизми?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `орқали кириш`
  String get by_enter {
    return Intl.message(
      'орқали кириш',
      name: 'by_enter',
      desc: '',
      args: [],
    );
  }

  /// `Кириш`
  String get login {
    return Intl.message(
      'Кириш',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Аккаунтингиз мавжуд эмасми?`
  String get akkauntingizMavjudEmasmi {
    return Intl.message(
      'Аккаунтингиз мавжуд эмасми?',
      name: 'akkauntingizMavjudEmasmi',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат йўналишини танланг`
  String get muammoingizgaTegishliBolimniTanlang {
    return Intl.message(
      'Мурожаат йўналишини танланг',
      name: 'muammoingizgaTegishliBolimniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Менинг мурожаатларим`
  String get meningMurojaatlarim {
    return Intl.message(
      'Менинг мурожаатларим',
      name: 'meningMurojaatlarim',
      desc: '',
      args: [],
    );
  }

  /// `Барчаси`
  String get all {
    return Intl.message(
      'Барчаси',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Ижродаги`
  String get ijrodagi {
    return Intl.message(
      'Ижродаги',
      name: 'ijrodagi',
      desc: '',
      args: [],
    );
  }

  /// `Якунланган`
  String get yakunlangan {
    return Intl.message(
      'Якунланган',
      name: 'yakunlangan',
      desc: '',
      args: [],
    );
  }

  /// `Шахсий кабинет`
  String get shaxsiyKabinet {
    return Intl.message(
      'Шахсий кабинет',
      name: 'shaxsiyKabinet',
      desc: '',
      args: [],
    );
  }

  /// `Муаммо турини танланг`
  String get muammoTuriniTanlang {
    return Intl.message(
      'Муаммо турини танланг',
      name: 'muammoTuriniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат`
  String get murojaat {
    return Intl.message(
      'Мурожаат',
      name: 'murojaat',
      desc: '',
      args: [],
    );
  }

  /// `Маълумот`
  String get malumot {
    return Intl.message(
      'Маълумот',
      name: 'malumot',
      desc: '',
      args: [],
    );
  }

  /// `Жавоб`
  String get javob {
    return Intl.message(
      'Жавоб',
      name: 'javob',
      desc: '',
      args: [],
    );
  }

  /// `Барча майдонларни тўлдиринг!`
  String get barchaMaydonlarniToldiring {
    return Intl.message(
      'Барча майдонларни тўлдиринг!',
      name: 'barchaMaydonlarniToldiring',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат юбориш`
  String get murojaatYuborish {
    return Intl.message(
      'Мурожаат юбориш',
      name: 'murojaatYuborish',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаатни шакллантириш`
  String get murojaatniShakllantirish {
    return Intl.message(
      'Мурожаатни шакллантириш',
      name: 'murojaatniShakllantirish',
      desc: '',
      args: [],
    );
  }

  /// `Вилоятни танланг`
  String get viloyatniTanlang {
    return Intl.message(
      'Вилоятни танланг',
      name: 'viloyatniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Туманни танланг`
  String get tumanniTanlang {
    return Intl.message(
      'Туманни танланг',
      name: 'tumanniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Манзилни киритинг`
  String get manzilniKiriting {
    return Intl.message(
      'Манзилни киритинг',
      name: 'manzilniKiriting',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат матни`
  String get murojaatMatni {
    return Intl.message(
      'Мурожаат матни',
      name: 'murojaatMatni',
      desc: '',
      args: [],
    );
  }

  /// `Файл бириктириш`
  String get faylBiriktirish {
    return Intl.message(
      'Файл бириктириш',
      name: 'faylBiriktirish',
      desc: '',
      args: [],
    );
  }

  /// `Юбориш`
  String get yuborish {
    return Intl.message(
      'Юбориш',
      name: 'yuborish',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат яратилди`
  String get murojaatYaratildi {
    return Intl.message(
      'Мурожаат яратилди',
      name: 'murojaatYaratildi',
      desc: '',
      args: [],
    );
  }

  /// `Ижрога юборилди`
  String get ijrogaYuborildi {
    return Intl.message(
      'Ижрога юборилди',
      name: 'ijrogaYuborildi',
      desc: '',
      args: [],
    );
  }

  /// `Ижро қилинмоқда`
  String get ijroQilinmoqda {
    return Intl.message(
      'Ижро қилинмоқда',
      name: 'ijroQilinmoqda',
      desc: '',
      args: [],
    );
  }

  /// `Қабул қилишга юборилди`
  String get qabulQilishgaYuborildi {
    return Intl.message(
      'Қабул қилишга юборилди',
      name: 'qabulQilishgaYuborildi',
      desc: '',
      args: [],
    );
  }

  /// `Якунланди`
  String get yakunlandi {
    return Intl.message(
      'Якунланди',
      name: 'yakunlandi',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат тури`
  String get murojaatTuri {
    return Intl.message(
      'Мурожаат тури',
      name: 'murojaatTuri',
      desc: '',
      args: [],
    );
  }

  /// `Бириктирилган файллар`
  String get biriktirilganFayllar {
    return Intl.message(
      'Бириктирилган файллар',
      name: 'biriktirilganFayllar',
      desc: '',
      args: [],
    );
  }

  /// `Шахсий маълумотлар`
  String get shaxsiyMalumotlar {
    return Intl.message(
      'Шахсий маълумотлар',
      name: 'shaxsiyMalumotlar',
      desc: '',
      args: [],
    );
  }

  /// `Фойдаланиш қўлланмаси`
  String get foydalanishQollanmasi {
    return Intl.message(
      'Фойдаланиш қўлланмаси',
      name: 'foydalanishQollanmasi',
      desc: '',
      args: [],
    );
  }

  /// `Созламалар`
  String get sozlamalar {
    return Intl.message(
      'Созламалар',
      name: 'sozlamalar',
      desc: '',
      args: [],
    );
  }

  /// `Илова ҳақида`
  String get ilovaHaqida {
    return Intl.message(
      'Илова ҳақида',
      name: 'ilovaHaqida',
      desc: '',
      args: [],
    );
  }

  /// `Улашиш`
  String get ulashish {
    return Intl.message(
      'Улашиш',
      name: 'ulashish',
      desc: '',
      args: [],
    );
  }

  /// `Ёрдам`
  String get yordam {
    return Intl.message(
      'Ёрдам',
      name: 'yordam',
      desc: '',
      args: [],
    );
  }

  /// `Паролни тиклаш`
  String get parolniTiklash {
    return Intl.message(
      'Паролни тиклаш',
      name: 'parolniTiklash',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат ҳолати`
  String get murojaatHolati {
    return Intl.message(
      'Мурожаат ҳолати',
      name: 'murojaatHolati',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат яратилган сана`
  String get murojaatYaratilganSana {
    return Intl.message(
      'Мурожаат яратилган сана',
      name: 'murojaatYaratilganSana',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат ижрога юборилган сана`
  String get murojaatIjrogaYuborilganSana {
    return Intl.message(
      'Мурожаат ижрога юборилган сана',
      name: 'murojaatIjrogaYuborilganSana',
      desc: '',
      args: [],
    );
  }

  /// `Ижро этилиш вақти`
  String get ijroEtishVaqti {
    return Intl.message(
      'Ижро этилиш вақти',
      name: 'ijroEtishVaqti',
      desc: '',
      args: [],
    );
  }

  /// `Мурожаат ижросига масъул бўлим ва ҳудудий инспекция`
  String get murojaatIjrosigaMasulBolimVaHududiyInspeksiya {
    return Intl.message(
      'Мурожаат ижросига масъул бўлим ва ҳудудий инспекция',
      name: 'murojaatIjrosigaMasulBolimVaHududiyInspeksiya',
      desc: '',
      args: [],
    );
  }

  /// `Ижрочилар`
  String get ijrochilar {
    return Intl.message(
      'Ижрочилар',
      name: 'ijrochilar',
      desc: '',
      args: [],
    );
  }

  /// `Ижрочининг изоҳи`
  String get ijrochiningIzohi {
    return Intl.message(
      'Ижрочининг изоҳи',
      name: 'ijrochiningIzohi',
      desc: '',
      args: [],
    );
  }

  /// `Билдиришнома`
  String get bildirishnomalar {
    return Intl.message(
      'Билдиришнома',
      name: 'bildirishnomalar',
      desc: '',
      args: [],
    );
  }

  /// `Туғилган кун`
  String get tugilganKun {
    return Intl.message(
      'Туғилган кун',
      name: 'tugilganKun',
      desc: '',
      args: [],
    );
  }

  /// `Ассалому алайкум,`
  String get assalomuAleykum {
    return Intl.message(
      'Ассалому алайкум,',
      name: 'assalomuAleykum',
      desc: '',
      args: [],
    );
  }

  /// `Илова тили`
  String get ilovaTili {
    return Intl.message(
      'Илова тили',
      name: 'ilovaTili',
      desc: '',
      args: [],
    );
  }

  /// `Илова кўриниши`
  String get ilovaKorinishi {
    return Intl.message(
      'Илова кўриниши',
      name: 'ilovaKorinishi',
      desc: '',
      args: [],
    );
  }

  /// `Тунги`
  String get tungi {
    return Intl.message(
      'Тунги',
      name: 'tungi',
      desc: '',
      args: [],
    );
  }

  /// `кундузги`
  String get kunduzgi {
    return Intl.message(
      'кундузги',
      name: 'kunduzgi',
      desc: '',
      args: [],
    );
  }

  /// `Аккаунтдан чиқиш`
  String get akkauntdanChiqish {
    return Intl.message(
      'Аккаунтдан чиқиш',
      name: 'akkauntdanChiqish',
      desc: '',
      args: [],
    );
  }

  /// `Қўллаб-қувватлаш телефони`
  String get qollabquvvatlashTelefoni {
    return Intl.message(
      'Қўллаб-қувватлаш телефони',
      name: 'qollabquvvatlashTelefoni',
      desc: '',
      args: [],
    );
  }

  /// `Телеграм орқали мурожаат`
  String get telegramOrqaliMurojaat {
    return Intl.message(
      'Телеграм орқали мурожаат',
      name: 'telegramOrqaliMurojaat',
      desc: '',
      args: [],
    );
  }

  /// `Мобиль рақамни тасдиқлаш`
  String get mobilRaqamniTasdiqlash {
    return Intl.message(
      'Мобиль рақамни тасдиқлаш',
      name: 'mobilRaqamniTasdiqlash',
      desc: '',
      args: [],
    );
  }

  /// `Рақамингизни текшириш учун SMS код юбордик. Илтимос, қуйидаги кодни киритинг`
  String
      get raqamingizniTekshirishUchunSmsKodYubordikIltimosQuyidagiKodniKiriting {
    return Intl.message(
      'Рақамингизни текшириш учун SMS код юбордик. Илтимос, қуйидаги кодни киритинг',
      name:
          'raqamingizniTekshirishUchunSmsKodYubordikIltimosQuyidagiKodniKiriting',
      desc: '',
      args: [],
    );
  }

  /// `Қайтадан юбориш`
  String get qaytadanYuborish {
    return Intl.message(
      'Қайтадан юбориш',
      name: 'qaytadanYuborish',
      desc: '',
      args: [],
    );
  }

  /// `Паролни тасдиқлаш`
  String get parolniTasdiqlash {
    return Intl.message(
      'Паролни тасдиқлаш',
      name: 'parolniTasdiqlash',
      desc: '',
      args: [],
    );
  }

  /// `Ҳурматли фойдаланувчи, илтимос, тизимга қайта киринг`
  String get hurmatliFoydalanuvchiIltimosTizimgaQaytadanKiring {
    return Intl.message(
      'Ҳурматли фойдаланувчи, илтимос, тизимга қайта киринг',
      name: 'hurmatliFoydalanuvchiIltimosTizimgaQaytadanKiring',
      desc: '',
      args: [],
    );
  }

  /// `Ҳа`
  String get ha {
    return Intl.message(
      'Ҳа',
      name: 'ha',
      desc: '',
      args: [],
    );
  }

  /// `Ўзгартириш`
  String get ozgartirish {
    return Intl.message(
      'Ўзгартириш',
      name: 'ozgartirish',
      desc: '',
      args: [],
    );
  }

  /// `Паролни тасдиқланг`
  String get parolniTasdiqlang {
    return Intl.message(
      'Паролни тасдиқланг',
      name: 'parolniTasdiqlang',
      desc: '',
      args: [],
    );
  }

  /// `Parolni tasdiqlashda xatolik bor`
  String get parolniTasdiqlashdaXatolikBor {
    return Intl.message(
      'Parolni tasdiqlashda xatolik bor',
      name: 'parolniTasdiqlashdaXatolikBor',
      desc: '',
      args: [],
    );
  }

  /// `Parol muvoffaqiyatli o'zgartirildi`
  String get parolMuvoffaqiyatliOzgartirildi {
    return Intl.message(
      'Parol muvoffaqiyatli o\'zgartirildi',
      name: 'parolMuvoffaqiyatliOzgartirildi',
      desc: '',
      args: [],
    );
  }

  /// `Ҳақиқатдан чиқишни хоҳлайсизми?`
  String get haqiqatdanChiqishniXohlaysizmi {
    return Intl.message(
      'Ҳақиқатдан чиқишни хоҳлайсизми?',
      name: 'haqiqatdanChiqishniXohlaysizmi',
      desc: '',
      args: [],
    );
  }

  /// `Йўқ`
  String get yoq {
    return Intl.message(
      'Йўқ',
      name: 'yoq',
      desc: '',
      args: [],
    );
  }

  /// `Ўзбек`
  String get en {
    return Intl.message(
      'Ўзбек',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Паролингизни тиклаш учун рўйхатдан ўтган телефон рақамингизни киритинг ва биз сизга паролингизни тиклашга ёрдам берамиз`
  String
      get parolingizniTiklashUchunRoyxatdanOtganTelefonRaqamingizniKiritingVaBiz {
    return Intl.message(
      'Паролингизни тиклаш учун рўйхатдан ўтган телефон рақамингизни киритинг ва биз сизга паролингизни тиклашга ёрдам берамиз',
      name:
          'parolingizniTiklashUchunRoyxatdanOtganTelefonRaqamingizniKiritingVaBiz',
      desc: '',
      args: [],
    );
  }

  /// `Call марказ\n1144`
  String get callCenter1111 {
    return Intl.message(
      'Call марказ\n1144',
      name: 'callCenter1111',
      desc: '',
      args: [],
    );
  }

  /// `Сизнинг телефон рақамингизга вақтинчалик пароль жўнатилди. Тизимга кирганингиздан сўнг албатта ўзгартиришни унутманг!`
  String
      get sizningTelefonRaqamingizgaVaqtinchalikParolJonatildiTizmgaKirganingizdanSongAlbatta {
    return Intl.message(
      'Сизнинг телефон рақамингизга вақтинчалик пароль жўнатилди. Тизимга кирганингиздан сўнг албатта ўзгартиришни унутманг!',
      name:
          'sizningTelefonRaqamingizgaVaqtinchalikParolJonatildiTizmgaKirganingizdanSongAlbatta',
      desc: '',
      args: [],
    );
  }

  /// `Сизнинг мурожаатингиз муваффақиятли равишда тизимга юборилди`
  String get sizningMurojatingizMuvaffaqiyatliRavishdaTizmgaYuborildi {
    return Intl.message(
      'Сизнинг мурожаатингиз муваффақиятли равишда тизимга юборилди',
      name: 'sizningMurojatingizMuvaffaqiyatliRavishdaTizmgaYuborildi',
      desc: '',
      args: [],
    );
  }

  /// `Yuklanmoqda...`
  String get yuklanmoqda {
    return Intl.message(
      'Yuklanmoqda...',
      name: 'yuklanmoqda',
      desc: '',
      args: [],
    );
  }

  /// `Расм манбасини танланг`
  String get rasmManbasiniTanlang {
    return Intl.message(
      'Расм манбасини танланг',
      name: 'rasmManbasiniTanlang',
      desc: '',
      args: [],
    );
  }

  /// `Камера`
  String get kamera {
    return Intl.message(
      'Камера',
      name: 'kamera',
      desc: '',
      args: [],
    );
  }

  /// `Галерея`
  String get galereya {
    return Intl.message(
      'Галерея',
      name: 'galereya',
      desc: '',
      args: [],
    );
  }

  /// `Юкланган файл ҳажми 10МБ дан ошмаслиги керак`
  String get yuklanganFaylHajmi10mbDanOshmasligiKerak {
    return Intl.message(
      'Юкланган файл ҳажми 10МБ дан ошмаслиги керак',
      name: 'yuklanganFaylHajmi10mbDanOshmasligiKerak',
      desc: '',
      args: [],
    );
  }

  /// `МФЙ (ОФЙ) номини киритинг`
  String get mfyOfyNominiKiriting {
    return Intl.message(
      'МФЙ (ОФЙ) номини киритинг',
      name: 'mfyOfyNominiKiriting',
      desc: '',
      args: [],
    );
  }

  /// `Кўча номини киритинг`
  String get kochaNominiKiriting {
    return Intl.message(
      'Кўча номини киритинг',
      name: 'kochaNominiKiriting',
      desc: '',
      args: [],
    );
  }

  /// `Уй рақамини киритинг`
  String get uyRaqaminiKiriting {
    return Intl.message(
      'Уй рақамини киритинг',
      name: 'uyRaqaminiKiriting',
      desc: '',
      args: [],
    );
  }

  /// `Ҳурматли фойдаланувчи! Мурожаатингизни кўриб чиқишни таъминлаш учун ўз манзилингизни тўғри ва аниқ кўрсатинг.`
  String
      get hurmatliFoydalanuvchiMurojaatingizniKoribChiqishnitaminlashUchunOzManzilingizniTogriVa {
    return Intl.message(
      'Ҳурматли фойдаланувчи! Мурожаатингизни кўриб чиқишни таъминлаш учун ўз манзилингизни тўғри ва аниқ кўрсатинг.',
      name:
          'hurmatliFoydalanuvchiMurojaatingizniKoribChiqishnitaminlashUchunOzManzilingizniTogriVa',
      desc: '',
      args: [],
    );
  }

  /// `Фойдаланувчини тизимдан ўчириш`
  String get hisobniOchirish {
    return Intl.message(
      'Фойдаланувчини тизимдан ўчириш',
      name: 'hisobniOchirish',
      desc: '',
      args: [],
    );
  }

  /// `Фойдаланувчи тизимдан ўчирилгандан сўнг, унинг шахсий маълумотлари ва мурожаатлар билан боғлиқ барча маълумотлар тизимидан ўчирилади. Aloqa nazorati мобиль иловаси қайта юклангандан сўнг фойдаланувчининг аввалги шахсий маълумотлари ва мурожаатлар билан боғлиқ маълумотлар қайта тикланмайди.`
  String
      get foydalanuvchiTizimdanOchirilgandanSongUningShaxsiyMalumotlariVaMurojaatlarBilan {
    return Intl.message(
      'Фойдаланувчи тизимдан ўчирилгандан сўнг, унинг шахсий маълумотлари ва мурожаатлар билан боғлиқ барча маълумотлар тизимидан ўчирилади. Aloqa nazorati мобиль иловаси қайта юклангандан сўнг фойдаланувчининг аввалги шахсий маълумотлари ва мурожаатлар билан боғлиқ маълумотлар қайта тикланмайди.',
      name:
          'foydalanuvchiTizimdanOchirilgandanSongUningShaxsiyMalumotlariVaMurojaatlarBilan',
      desc: '',
      args: [],
    );
  }

  /// `Мобиль телефон билан боғлиқ сабаблар (телефоннинг йўқолиши, бошқа одамга бериб юбориш, рақамнинг ўзгариши ва б.);`
  String
      get mobilTelefonBilanBogliqSabablarTelefonningYoqolishiBoshqaOdamgaBerib {
    return Intl.message(
      'Мобиль телефон билан боғлиқ сабаблар (телефоннинг йўқолиши, бошқа одамга бериб юбориш, рақамнинг ўзгариши ва б.);',
      name:
          'mobilTelefonBilanBogliqSabablarTelefonningYoqolishiBoshqaOdamgaBerib',
      desc: '',
      args: [],
    );
  }

  /// `Илова билан боғлиқ сабаблар (илованинг кўриши тушунарсиз, иловадан фойдаланиш қийин ва б.);`
  String
      get ilovaBilanBogliqSabablarIlovaningKorishiTushunarsizIlovadanFoydalanishQiyin {
    return Intl.message(
      'Илова билан боғлиқ сабаблар (илованинг кўриши тушунарсиз, иловадан фойдаланиш қийин ва б.);',
      name:
          'ilovaBilanBogliqSabablarIlovaningKorishiTushunarsizIlovadanFoydalanishQiyin',
      desc: '',
      args: [],
    );
  }

  /// `Бошқа масалалар.`
  String get boshqaMasalalar {
    return Intl.message(
      'Бошқа масалалар.',
      name: 'boshqaMasalalar',
      desc: '',
      args: [],
    );
  }

  /// `Қўшимча изоҳ қолдириш`
  String get qoshimchaIzohQoldirish {
    return Intl.message(
      'Қўшимча изоҳ қолдириш',
      name: 'qoshimchaIzohQoldirish',
      desc: '',
      args: [],
    );
  }

  /// `Фойдаланувчини тизимдан ўчириш фойдаланувчининг қарорига қараб амалга оширилади. Ҳурматли фойдаланувчи, Aloqa nazorati мобиль иловасини ўчиришдан аввал ўчириш сабабларини кўрсатинг:`
  String
      get foydalanuvchiniTizimdanOchirishFoydalanuvchiningQarorigaQarabAmalgaOshiriladiHurmatliFoydalanuvchi {
    return Intl.message(
      'Фойдаланувчини тизимдан ўчириш фойдаланувчининг қарорига қараб амалга оширилади. Ҳурматли фойдаланувчи, Aloqa nazorati мобиль иловасини ўчиришдан аввал ўчириш сабабларини кўрсатинг:',
      name:
          'foydalanuvchiniTizimdanOchirishFoydalanuvchiningQarorigaQarabAmalgaOshiriladiHurmatliFoydalanuvchi',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
