import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorLogOutAlertDialog extends StatelessWidget {
  const ErrorLogOutAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:
          Text(S.of(context).hurmatliFoydalanuvchiIltimosTizimgaQaytadanKiring),
      actions: <Widget>[
        ElevatedButton(onPressed: () {}, child: Text(S.of(context).ha))
      ],
    );
  }
}
