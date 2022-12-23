import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_school/models/user_model.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'nisn': user.nisn,
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
          name: snapshot['name'],
          email: snapshot['email'],
          nisn: snapshot['nisn']);
    } catch (e) {
      throw e;
    }
  }
}
