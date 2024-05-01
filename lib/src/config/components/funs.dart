import 'dart:io';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

String textLocale(Name? name, String lang) {
  String text;
  if (lang == 'uz') {
    text = name?.uz ?? "--";
  } else if (lang == 'ru') {
    text = name?.ru ?? '--';
  } else {
    text = name?.oz ?? "--";
  }
  return text;
}

String textPDFPath(String lang) {
  String text;
  if (lang == 'uz') {
    text = 'assets/pdfs/about_app_uz.pdf';
  } else if (lang == 'ru') {
    text = 'assets/pdfs/about_app_ru.pdf';
  } else {
    text = 'assets/pdfs/about_app_en.pdf';
  }
  return text;
}

String textTitle(String status, BuildContext context) {
  String textColor = "";
  switch (status) {
    case "1":
      textColor = S.of(context).murojaatYaratildi;
      break;
    case "2":
      textColor = S.of(context).ijrogaYuborildi;
      break;
    case "3":
      textColor = S.of(context).ijroQilinmoqda;
      break;
    case "4":
      textColor = S.of(context).qabulQilishgaYuborildi;
      break;
    case "5":
      textColor = S.of(context).yakunlandi;
      break;
    default:
      textColor = "default";
      break;
  }
  return textColor;
}

Color textColor(String status) {
  late Color textColor = Colors.white;
  switch (status) {
    case "1":
      textColor = AppColors.createdColor;
      break;
    case "2":
      textColor = AppColors.sentColor;
      break;
    case "3":
      textColor = AppColors.progressColor;
      break;
    case "4":
      textColor = AppColors.sentToAcceptColor;
      break;
    case "5":
      textColor = AppColors.completesColor;
      break;
    default:
      textColor = Colors.red;
      break;
  }
  return textColor;
}

class PDFApi {
  static Future<File> loadAsset(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    return _storeFile(path, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = url;
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
