import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter/models/user.dart';

enum Errors {none, matchError, weakError, existsError, error, wrongError, noUserError}

class Auth extends ChangeNotifier {
  final firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
  final CollectionReference<User> usersRef = FirebaseFirestore.instance.collection('users').withConverter<User>(
    fromFirestore: (snapshot, _) {
      return User.fromJson(
        snapshot.data() ?? {},
      );
    },
    toFirestore: (user, _) => user.toJson(),
  );

  Future<Errors> attemptSignUp(String email, String name, String password, String passwordConfirmation) async {
    try {
      if (password == passwordConfirmation) {
        return Errors.matchError;
      }

      final authResult = await auth.createUserWithEmailAndPassword(email: email, password: password);

      if (authResult.user != null) {
        // Create a new User object
        final newUser = User(
          key: authResult.user!.uid,
          userID: authResult.user!.uid,
          email: email,
          userName: name,
          displayName: '',
          imageUrl: '',
          followers: 0,
          following: 0,
          followersList: [],
          followingList: [],
          // Initialize other fields as needed
        );

        // Add the user to the Firestore "users" collection
        await usersRef.doc(authResult.user!.uid).set(newUser);

        return Errors.none; // Successful sign-up
      } else {
        return Errors.noUserError;
      }
    } catch (error) {
      if (error is firebase_auth.FirebaseAuthException) {
        switch (error.code) {
          case 'weak-password':
            return Errors.weakError;
          case 'email-already-in-use':
            return Errors.existsError;
          default:
            return Errors.error;
        }
      } else {
        return Errors.error;
      }
    }
  }

  Future<Errors> attemptLogin(String email, String password) async {
    try {
      final authResult = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResult.user != null) {
        return Errors.none; // Successful login
      } else {
        return Errors.noUserError;
      }
    } catch (error) {
      if (error is firebase_auth.FirebaseAuthException) {
        switch (error.code) {
          case 'user-not-found':
            return Errors.noUserError;
          case 'wrong-password':
            return Errors.wrongError;
          default:
            return Errors.error;
        }
      } else {
        return Errors.error;
      }
    }
  }
}
