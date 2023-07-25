import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserServices {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection("users");

  //Membuat Method
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'city': user.city,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot["email"],
        name: snapshot["name"],
        city: snapshot["city"],
      );
    } catch (e) {
      throw e;
    }
  }
}
