import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          children: [
            Row(children: [
              Icon(
                Icons.notifications_active,
                color: Colors.black54,
              ),
              SizedBox(
                width: 8.0,
                height: 16.0,
              ),
              Text(
                'การแจ้งเตือน',
                style: TextStyle(
                  fontSize: 22.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'FC-Minimal-Regular',
                ),
              ),
            ]),
            Divider(
              color: Colors.black54,
            ),
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 22.0,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
                // fontStyle: FontStyle.italic,
                fontFamily: 'FC-Minimal-Regular',
              ),
            ),
          ],
        ),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: Text("ตกลง"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // ignore: deprecated_member_use
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      );
    },
  );
}
