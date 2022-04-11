import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/dialog.dart';
import 'package:test1/model.dart';
import 'package:test1/normal_dialog.dart';
import 'package:test1/progrees.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Model model;

  late double screenWidth;
  late double screenHight;
  String? bankname, amount, account, reference, fee;
  List<Model> models = [];

  final _bankname = TextEditingController();
  final _amount = TextEditingController();
  final _account = TextEditingController();
  final _reference = TextEditingController();
  final _fee = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('test1'),
        centerTitle: true,
      ),
      body: buildContent(context),
    );
  }

  SafeArea buildContent(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        banknameForm(),
                        SizedBox(
                          height: 20,
                        ),
                        amountForm(),
                        SizedBox(
                          height: 20,
                        ),
                        accountForm(),
                        SizedBox(
                          height: 20,
                        ),
                        referenceForm(),
                        SizedBox(
                          height: 20,
                        ),
                        feeForm(),
                        SizedBox(
                          height: 20,
                        ),
                        button(),
                        SizedBox(
                          height: 20,
                        ),Container(
                          child: models.isEmpty ? null :
                          buildTitle(),
                        ),
                        buildList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      // padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ธนาคาร'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ยอดเงิน'),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('เลขที่บัญชี'),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('อ้างอิง'),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ค่าธรรมเนียม'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList() => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: models.length,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    models[index].bankname!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        models[index].amount!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          models[index].account!,
                          //overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          models[index].reference!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        models[index].fee!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget banknameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.85,
            child: TextField(
              //  onChanged: (value) => name = value.trim(),
              controller: _bankname,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.comment_bank,
                  color: Colors.black54,
                ),
                labelStyle: TextStyle(
                  fontSize: 22.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'FC-Minimal-Regular',
                ),
                labelText: 'ชื่อธนาคาร : ',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
          ),
        ],
      );

  Widget amountForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.85,
            child: TextField(
              //  onChanged: (value) => lastname = value.trim(),
              controller: _amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.money_rounded,
                  color: Colors.black54,
                ),
                labelStyle: TextStyle(
                  fontSize: 22.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'FC-Minimal-Regular',
                ),
                labelText: 'ยอดเงินที่นำฝาก : ',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
          ),
        ],
      );

  Widget accountForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.85,
            child: TextField(
              //  onChanged: (value) => phone = value.trim(),
              controller: _account,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: Colors.black54,
                ),
                labelStyle: TextStyle(
                  fontSize: 22.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'FC-Minimal-Regular',
                ),
                labelText: 'เลขที่บัญชีธนาคาร : ',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
          ),
        ],
      );

  Widget referenceForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.85,
            child: TextField(
              //  onChanged: (value) => user = value.trim(),
              controller: _reference,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.black54,
                ),
                labelStyle: TextStyle(
                  fontSize: 22.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'FC-Minimal-Regular',
                ),
                labelText: 'หมายเลขอ้างอิง : ',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
          ),
        ],
      );

  Widget feeForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.85,
            child: TextField(
              //   onChanged: (value) => password = value.trim(),
              controller: _fee,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black54,
                ),
                labelStyle: TextStyle(
                  fontSize: 22.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'FC-Minimal-Regular',
                ),
                labelText: 'ค่าธรรมเนียม : ',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
          ),
        ],
      );

  Widget button() => Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        width: screenWidth * 0.6,
        child: ElevatedButton.icon(
          onPressed: () {
            bankname = _bankname.value.text;
            amount = _amount.value.text;
            account = _account.value.text;
            reference = _reference.value.text;
            fee = _fee.value.text;
            if (bankname == null || bankname!.isEmpty) {
              showdialog(context, 'กรอกชื่อธนาคารด้วยคะ');
            } else if (amount == null || amount!.isEmpty) {
              showdialog(context, 'กรอกยอดเงินที่นำฝากด้วยคะ');
            } else if (account == null || account!.isEmpty) {
              showdialog(context, 'กรอกเลขที่บัญชีธนาคารด้วยคะ');
            } else if (reference == null || reference!.isEmpty) {
              showdialog(context, 'กรอกหมายเลขอ้างอิงด้วยคะ');
            } else if (fee == null || fee!.isEmpty) {
              showdialog(context, 'กรอกค่าธรรมเนียมด้วยคะ');
            } else {
              dialog(context);
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          icon: Icon(Icons.cloud_upload_outlined),
          label: Text('ยืนยันฝากเงิน'),
        ),
      );

  Future<void> dialog(BuildContext context) async {
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
                  color: Colors.redAccent,
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
          '\nยืนยันการฝากเงิน\n',
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

              Map<String, dynamic> map = Map();
              map['Bankname'] = bankname;
              map['Amount'] = amount;
              map['Account'] = account;
              map['Reference'] = reference;
              map['Fee'] = fee;
              model = Model.fromJson(map);
              setState(
                () {
                  models.add(model);

                  _bankname.clear();
                  _amount.clear();
                  _account.clear();
                  _reference.clear();
                  _fee.clear();
                },
              );
            },
          ),
          CupertinoDialogAction(
            child: Text("ยกเลิก"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
