const String tableAccounts = 'accounts';


class AccountFields {
  static final String id = '_id';
  static final String email = 'email';
  static final String password = 'password';
  static final String name = 'name';
  static final String birthdate = 'birthdate';

}

class Account {

  final int? id;
  final String email;
  final String password;
  final String name;
  final String birthdate;

  const Account({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.birthdate,
  });

  Account copy({
    int? id,
    String? email,
    String? password,
    String? name,
    String? birthdate
  }) =>
      Account(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        birthdate: birthdate ?? this.birthdate,
      );

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'email': email,
      'password': password,
      'name': name,
      'birthdate': birthdate,
    };
  }



}

