import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ta_schizo/models/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection("users");

  Future<UserModel> settingUp(
      String id, String? username, String? imageUrl) async {
    UserModel user;
    try {
      final QuerySnapshot result =
          await _userReference.where("id", isEqualTo: id).get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.isEmpty) {
        _userReference.doc(id).set(<String, dynamic>{
          "id": id,
          "username": username,
          "gender": "",
          "age": "",
          "imageUrl": imageUrl
        });

        user = UserModel(
            id: id,
            username: username,
            age: "",
            gender: "",
            imageUrl: imageUrl);
      } else {
        DocumentSnapshot snapshot = documents[0];
        user = UserModel(
          id: id,
          username: snapshot["username"],
          age: snapshot["age"],
          gender: snapshot["gender"],
          imageUrl: snapshot["imageUrl"],
        );
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> fetchUserDataById(String id) async {
    try {
      DocumentSnapshot documentSnapshot = await _userReference.doc(id).get();
      UserModel user = UserModel(
          id: id,
          username: documentSnapshot['username'],
          age: documentSnapshot['age'],
          gender: documentSnapshot['gender'],
          imageUrl: documentSnapshot['imageUrl']);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDataFirestore(
      String id, Map<String, String> dataNeedUpdate) {
    return _userReference.doc(id).update(dataNeedUpdate);
  }
}
