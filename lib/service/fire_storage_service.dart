
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/services.dart';
import 'package:appchat/models/phone_number.dart';
import 'package:isar/isar.dart';

class FireStorageService {
  final CollectionReference _userCollectionReference = FirebaseFirestore.instance.collection('user');

  Future createPhoneNumber(PhoneNumber phoneNumber) async {
    try {
      await _userCollectionReference.doc(phoneNumber.phone).set(phoneNumber.toJson());
    } catch (e){
      if (e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }
}
