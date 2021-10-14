class EndUser {
  final String? userID;
  final String? username;
  final String? userDPURL;

  EndUser({this.userID, this.username, this.userDPURL});

  factory EndUser.fromMap(data) {
    return EndUser(
        userID: data['UID'],
        username: data['username'],
        userDPURL: data['userDPURL']);
  }

  Map<String, dynamic> toMap() {
    return {
      'UID': userID,
      'username': username,
      'userDPURL': userDPURL,
    };
  }
}
