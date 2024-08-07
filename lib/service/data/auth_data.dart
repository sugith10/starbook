import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/util/app_logger.dart';
import '../../model/user_model.dart';

class RemoteDataSource {
  ///  Login
  Future<UserModel> emailSignIn(String email, String password) async {
    try {
      // /Firebase Auth API to Sign 
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Get the user document from Firebase Firestore
      final userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid);

      // Get the user snapshot from Firebase Firestore
      DocumentSnapshot userSnapshot = await userDocRef.get();

      // If the user snapshot exists
      if (userSnapshot.exists) {
        // Get the data from the user snapshot
        final data = userSnapshot.data() as Map<String, dynamic>;
        // Create a user model from the data
        final authUser = UserModel.fromMap(data);
        appLogger.d('User signed in successfully');
        // Return the user model
        return authUser;
      } else {
        // Throw an exception if the user does not exist
        appLogger.d("User does not exist");
        throw Exception();
      }
    } catch (e) {
      // Throw an exception if any error occurs
      appLogger.d("Error signing in: $e");
      throw Exception(e);
    }
  }

  /// Create new account
  Future<UserModel> emailSignUp(
      String email, String password, String name) async {
    try {
      // /Firebase Auth API to Sign up with email and password
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user!;
      final UserModel userModel = UserModel(
        userId: user.uid,
        email: user.email!,
        userName: name,
      );
      // Get the user document from Firebase Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userModel.toMap());

      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
