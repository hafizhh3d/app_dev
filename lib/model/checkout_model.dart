class CheckoutModel {
  late String street,
      city,
      state,
      country,
      phone,
      card,
      name,
      expDate,
      cvv,
      totalPrice,
      date;

  CheckoutModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.card,
    required this.name,
    required this.expDate,
    required this.cvv,
    required this.totalPrice,
    required this.date,
  });

  CheckoutModel.fromJson(Map<dynamic, dynamic> map) {
    street = map['street'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
    card = map['card'];
    name = map['name'];
    expDate = map['expDate'];
    cvv = map['cvv'];
    phone = map['phone'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'card': card,
      'name': name,
      'expDate': expDate,
      'cvv': cvv,
      'phone': phone,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}
