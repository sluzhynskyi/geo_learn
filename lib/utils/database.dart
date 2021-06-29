import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseManager {
  static final CollectionReference _profileList =
      FirebaseFirestore.instance.collection("users");

  static Future<void> setScore(String uid, int score) async {
    await _profileList.doc(uid).set({"score": score});
  }

  static Future<int> getScore(String uid) async {
    DocumentSnapshot snapshot = await _profileList.doc(uid).get();
    // print("UID: $uid");
    return snapshot["score"] ?? 0;
  }

  // static Stream<UserProfile> profile(String uid){
  //   return _profileList.doc(uid).snapshots().map(
  //     (DocumentSnapshot snapshot){
  //       return UserProfile(snapshot["username"], snapshot["score"]);
  //   });
  // }

  static Future<void> updateScore(String uid, int byScore) async {
    int currentScore = await getScore(uid);

    await setScore(uid, currentScore + byScore);
  }
}

class UserProfile{
  String username = "";
  int score = 0;
  UserProfile(String? username, int? score):username=username??"", score=score??0;
  // static Future<UserProfile> fetch(String uid){
  //   return UserProfile("")
  // }
}