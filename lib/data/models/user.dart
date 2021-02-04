class User {
  String username = '';
  String phone = '';
  String password = '';

  User({this.username = '', this.phone = '', this.password = ''});

  @override
  bool operator ==(Object other) =>
      other is User &&
      other.password == other.password &&
      other.username == other.username;

  @override
  int get hashCode => super.hashCode;

}
