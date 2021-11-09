class EndUser {
  final String? userID;
  final String? userType;
  final String? username;
  final String? userDPURL;

  EndUser({this.userID, this.userType, this.username, this.userDPURL});

  factory EndUser.fromMap(data) {
    return EndUser(
        userID: data['UID'],
        userType: data['userType'],
        username: data['username'],
        userDPURL: data['userDPURL']);
  }

  Map<String, dynamic> toMap() {
    return {
      'UID': userID,
      'userType': userType,
      'username': username,
      'userDPURL': userDPURL,
    };
  }
}
