class CardModel {
  late String email, cardNum, expDate, cvv, name;

  CardModel({
    required this.email,
    required this.cardNum,
    required this.expDate,
    required this.cvv,
    required this.name,
  });

  CardModel.fromJson(Map<dynamic, dynamic> map) {
    email = map['email'];
    cardNum = map['cardNum'];
    expDate = map['expDate'];
    cvv = map['cvv'];
    name = map['name'];
  }

  toJson() {
    return {
      'email': email,
      'cardNum': cardNum,
      'expDate': expDate,
      'cvv': cvv,
      'name': name,
    };
  }
}
