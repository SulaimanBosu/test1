

class Model {
  String? bankname;
  String? amount;
  String? account;
  String? reference;
  String? fee;

  Model({
    this.bankname,
    this.amount,
    this.account,
    this.reference,
    this.fee,
  });

  Model.fromJson(Map<String, dynamic> json) {
    bankname = json['Bankname'];
    amount = json['Amount'];
    account = json['Account'];
    reference = json['Reference'];
    fee = json['Fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bankname'] = this.bankname;
    data['Amount'] = this.amount;
    data['Account'] = this.account;
    data['Reference'] = this.reference;
    data['Fee'] = this.fee;
    return data;
  }
}
