// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthUtil {
//   static Future<User?> getCurrentUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userId = prefs.getString('user_id');
//
//     if (userId != null && userId.isNotEmpty) {
//       return FirebaseAuth.instance.currentUser;
//     }
//
//     return null;
//   }
// }