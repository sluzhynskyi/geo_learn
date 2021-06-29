import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  static final CollectionReference _profileList =
      FirebaseFirestore.instance.collection("users");

  static Future<void> setScore(String uid, int score) async {
    await _profileList.doc(uid).set({"score": score});
  }

  static Future<int> getScore(String uid) async {
    DocumentSnapshot snapshot = await _profileList.doc(uid).get();

    return snapshot["score"] ?? 0;
  }

  static Future<void> updateScore(String uid, int byScore) async {
    int currentScore = await getScore(uid);

    await setScore(uid, currentScore + byScore);
  }
}
