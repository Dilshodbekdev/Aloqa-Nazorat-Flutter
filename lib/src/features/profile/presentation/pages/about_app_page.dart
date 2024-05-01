import 'dart:io';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> _openPDFFromAssets(String path) async {
      try {
        // Load the PDF asset as a byte list
        ByteData data = await rootBundle.load(path);
        List<int> bytes = data.buffer.asUint8List();

        // Open the PDF using the open_file package
        final tempFile = File('${(await getTemporaryDirectory()).path}/sample.pdf');
        await tempFile.writeAsBytes(bytes);
        await OpenFile.open(tempFile.path);
      } catch (e) {
        print('Error opening PDF: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).ilovaHaqida,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(),
    );
  }


}
