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

  /// `Telefon raqami`
  String get phone_number {
    return Intl.message(
      'Telefon raqami',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Ro'yxatdan o'tish`
  String get register {
    return Intl.message(
      'Ro\'yxatdan o\'tish',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Ism`
  String get name {
    return Intl.message(
      'Ism',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Familiya`
  String get surname {
    return Intl.message(
      'Familiya',
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

  /// `Sharifi`
  String get mid_name {
    return Intl.message(
      'Sharifi',
      name: 'mid_name',
      desc: '',
      args: [],
    );
  }

  /// `Parol`
  String get password {
    return Intl.message(
      'Parol',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `O'zkomnazorat inspeksiyasi`
  String get uz_com {
    return Intl.message(
      'O\'zkomnazorat inspeksiyasi',
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

  /// `Keyingisi`
  String get next {
    return Intl.message(
      'Keyingisi',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Ro’yxatdan o’ting`
  String get intro_title_1 {
    return Intl.message(
      'Ro’yxatdan o’ting',
      name: 'intro_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Mobil ilovadan foydalanish uchun ID.gov.uz tizimi orqali avtorizatsiyadan oʻting yoki mavjud profilingiz orqali tizimga kiring`
  String get intro_desc_1 {
    return Intl.message(
      'Mobil ilovadan foydalanish uchun ID.gov.uz tizimi orqali avtorizatsiyadan oʻting yoki mavjud profilingiz orqali tizimga kiring',
      name: 'intro_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Muammo bo’yicha xabar bering`
  String get intro_title_2 {
    return Intl.message(
      'Muammo bo’yicha xabar bering',
      name: 'intro_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Axborotlashtirish va telekommunikatsiyalar sohasida mavjud muammolar haqida xabar bering`
  String get intro_desc_2 {
    return Intl.message(
      'Axborotlashtirish va telekommunikatsiyalar sohasida mavjud muammolar haqida xabar bering',
      name: 'intro_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Muammo yechilishi bo’yicha natijani kuting`
  String get intro_title_3 {
    return Intl.message(
      'Muammo yechilishi bo’yicha natijani kuting',
      name: 'intro_title_3',
      desc: '',
      args: [],
    );
  }

  /// `Axborotlashtirish va telekommunikatsiyalar sohasida mavjud muammolar haqida xabar bering`
  String get intro_desc_3 {
    return Intl.message(
      'Axborotlashtirish va telekommunikatsiyalar sohasida mavjud muammolar haqida xabar bering',
      name: 'intro_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Natijani ko’ring va baholang`
  String get intro_title_4 {
    return Intl.message(
      'Natijani ko’ring va baholang',
      name: 'intro_title_4',
      desc: '',
      args: [],
    );
  }

  /// `Sizning muammongiz xal etilishi bo’yicha natija bilan tanishing va tizimga o’z bahoingizni qo’ying`
  String get intro_desc_4 {
    return Intl.message(
      'Sizning muammongiz xal etilishi bo’yicha natija bilan tanishing va tizimga o’z bahoingizni qo’ying',
      name: 'intro_desc_4',
      desc: '',
      args: [],
    );
  }

  /// `Asosiy`
  String get main {
    return Intl.message(
      'Asosiy',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Murojaatlar`
  String get references {
    return Intl.message(
      'Murojaatlar',
      name: 'references',
      desc: '',
      args: [],
    );
  }

  /// `Profil`
  String get profile {
    return Intl.message(
      'Profil',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Parolni unutdingizmi?`
  String get forgot_password {
    return Intl.message(
      'Parolni unutdingizmi?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `orqali kirish`
  String get by_enter {
    return Intl.message(
      'orqali kirish',
      name: 'by_enter',
      desc: '',
      args: [],
    );
  }

  /// `Kirish`
  String get login {
    return Intl.message(
      'Kirish',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Ro'yxatdan o'tish`
  String get royxatdanOtish {
    return Intl.message(
      'Ro\'yxatdan o\'tish',
      name: 'royxatdanOtish',
      desc: '',
      args: [],
    );
  }

  /// `Akkauntingiz mavjud emasmi?`
  String get akkauntingizMavjudEmasmi {
    return Intl.message(
      'Akkauntingiz mavjud emasmi?',
      name: 'akkauntingizMavjudEmasmi',
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
