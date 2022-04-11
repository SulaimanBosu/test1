import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showdialog(
  BuildContext context,
  String message,
) async {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.notifications_active,
                color: Colors.red,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'การแจ้งเตือน',
                style: TextStyle(
                  fontSize: 20.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'FC-Minimal-Regular',
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black54,
          ),
        ],
      ),
      content: Text(
        '\n$message\n',
        style: TextStyle(
          fontSize: 20.0,
          // fontWeight: FontWeight.bold,
          color: Colors.black54,
          // fontStyle: FontStyle.italic,
          fontFamily: 'FC-Minimal-Regular',
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text("ตกลง"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // CupertinoDialogAction(
        //   child: Text("ตกลง"),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // CupertinoDialogAction(
        //   child: Text("ยกเลิก"),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ],
    ),
  );
}
