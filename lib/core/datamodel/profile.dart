import 'package:flutter/material.dart';

class Profile {
  String? profileName;
  String? profileDesc;
  List<String>? profilePhotosURL;
  String? profileDPURL;
  String? profileID;
  String? profileAddress;
  String? profileContact;
  List<String>? postsPIDList;
  double? lat;
  double? long;

  Profile({
    @required this.profileID,
    @required this.profileName,
    @required this.profileDPURL,
    @required this.profileDesc,
    @required this.profileContact,
    @required this.profileAddress,
    @required this.profilePhotosURL,
    @required this.postsPIDList,
    @required this.lat,
    @required this.long,
  });

  factory Profile.fromMap(Map data) {
    return Profile(
      profileID: data['profileID'],
      profileName: data['profileName'],
      profileDPURL: data['profileDPURL'],
      profileDesc: data['profileDesc'],
      profileContact: data['profileContact'],
      profileAddress: data['profileAddress'],
      profilePhotosURL: data['profilePhotosURL'],
      postsPIDList: data['postsPIDList'],
      lat: data['lat'],
      long: data['long'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profileID': profileID,
      'profileName': profileName,
      'profileDPURL': profileDPURL,
      'profileDesc': profileDesc,
      'profileContact': profileContact,
      'profileAddress': profileAddress,
      'profilePhotosURL': profilePhotosURL,
      'postsPIDList': postsPIDList,
      'lat': lat,
      'long': long,
    };
  }
}
