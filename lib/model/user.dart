const String tableUsers = 'users';

class UserFields {
  static final String id = '_id';
  static final String username = 'username';
  static final String password = 'password';

}

class User {
  final int? id;
  final String username;
  final String password;


  const User({
    this.id,
    required this.username,
    required this.password,


  });

  User copy({
    int? id,
    String? username,
    String? password,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
      );



  // Map<String, Object?> toJson() => {
  //   UserFields.id: id,
  //   UserFields.username: username,
  //   UserFields.password: password,
  // };

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }



}

