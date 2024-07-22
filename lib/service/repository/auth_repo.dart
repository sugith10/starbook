import 'package:firebase_auth/firebase_auth.dart';

import '../../core/util/app_exception.dart';
import '../../model/user_model.dart';
import '../data/auth_data.dart';

class AuthRepo {
  final RemoteDataSource _remoteDataSource;
  AuthRepo(this._remoteDataSource);

  Future<UserModel> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final UserModel user =
          await _remoteDataSource.emailSignUp(email, password, name);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const AppException(
            alert: 'Network Error',
            details: "Please check your internet connection and try again.");
      } else if (e.code == 'too-many-requests') {
        throw const AppException(
          alert: 'Too Many Requests',
          details:
              'We\'re experiencing a high volume of requests. Please try again later...',
        );
      } else {
        // If any other Firebase Auth Exception exception, throw an AppException
        throw const AppException();
      }
    } catch (e) {
      // If any other exception, throw an AppException
      throw const AppException();
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      return await _remoteDataSource.emailSignIn(email, password);
    } on FirebaseAuthException catch (e) {
      // Check the FirebaseAuthException code
      if (e.code == 'network-request-failed') {
        throw const AppException(
            alert: 'Network Error',
            details: "Please check your internet connection and try again.");
      } else if (e.code == 'user-not-found') {
        throw const AppException(
          alert: 'user-not-found',
          details: 'Check RemoteDataSource',
        );
      } else if (e.code == 'wrong-password') {
        throw const AppException(
          alert: 'wrong-password',
          details: 'Check RemoteDataSource',
        );
      } else if (e.code == 'invalid-credential') {
        throw const AppException(
          alert: 'Invalid credentials.',
          details: 'Please check your username and password and try again.',
        );
      } else if (e.code == 'too-many-requests') {
        throw const AppException(
          alert: 'Too Many Requests',
          details:
              'We\'re experiencing a high volume of requests. Please try again later...',
        );
      } else {
        // If any other exception, throw an AppException
        throw const AppException(
          alert: 'User Not Found',
          details: 'Please check the provided details.',
        );
      }
    } catch (e) {
      throw const AppException(
        alert: 'User Not Found',
        details: 'Please check the provided details.',
      );
    }
  }
}
