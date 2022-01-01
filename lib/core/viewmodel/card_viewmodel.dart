import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../services/firestore_card.dart';
import '../viewmodel/cart_viewmodel.dart';
import '../../model/card_model.dart';

class CardViewModel extends GetxController {
  String? email, cardNum, expDate, cvv, name;

  List<CardModel> _card = [];

  List<CardModel> get card => _card;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    _getCardFromFireStore();
  }

  _getCardFromFireStore() async {
    _isLoading = true;
    _card = [];
    List<QueryDocumentSnapshot> _cardSnapshot =
        await FirestoreCard().getOrdersFromFirestore();
    _cardSnapshot.forEach((card) {
      _card.add(CardModel.fromJson(card.data() as Map<String, dynamic>));
    });
    _isLoading = false;
    update();
  }

  addCardToFireStore() async {
    await FirestoreCard().addOrderToFirestore(CardModel(
      email: email!,
      cardNum: cardNum!,
      expDate: expDate!,
      cvv: cvv!,
      name: name!,
    ));
    //Get.find<CartViewModel>().removeAllProducts();
    //Get.back();
    _getCardFromFireStore();
  }
}
