import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/services/snack_bar_services.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseServices {
  static Future<bool> createAccount(
      {required String emailAddress, required String password}) async {
    EasyLoading.show();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarService.showSuccessMessage("Account created successfully");

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
            e.message ?? 'The password provided is too weak.');
        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
            e.message ?? 'The account already exists for that email.');
        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      SnackBarService.showErrorMessage(
          "An unexpected error occurred. Please try again.");
      return Future.value(false);
    }
  }

  static Future<bool> login(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      SnackBarService.showSuccessMessage("login in successfully");
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? 'No user found for that email.');
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(
            e.message ?? 'Wrong password provided for that user.');
        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      SnackBarService.showErrorMessage(
          "An unexpected error occurred. Please try again.");
      return Future.value(false);
    }
  }

//do converter , current operation
  static CollectionReference<EventDataModel> getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventDataModel.collectionName)
        .withConverter(
            fromFirestore: (snapshot, _) =>
                EventDataModel.fromFireStore(snapshot.data()!),
            toFirestore: (eventModel, _) => eventModel.toFireStore());
  }

  static Future<bool> createNewEvent(EventDataModel data) async {
    try {
      var collectionRef = getCollectionReference();
      var docRef = collectionRef.doc();
      data.eventID = docRef.id;
      docRef.set(data);
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  Future readEvent(EventDataModel eventModel) async {
    final collectionRef = getCollectionReference();

    var getDoc = collectionRef.doc();
    eventModel.eventID = getDoc.id;
    return getDoc.set(eventModel);
  }
}
