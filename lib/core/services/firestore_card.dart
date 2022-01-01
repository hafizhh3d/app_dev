import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/card_model.dart';

class FirestoreCard {
  final CollectionReference _cardCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('card');

  Future<List<QueryDocumentSnapshot>> getOrdersFromFirestore() async {
    var _card = await _cardCollection.orderBy('date', descending: true).get();
    return _card.docs;
  }

  addOrderToFirestore(CardModel cardModel) async {
    await _cardCollection.doc().set(cardModel.toJson());
  }
}
