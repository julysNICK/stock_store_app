class Login_store {
  String sessionId;
  String accessToken;
  String AcessTokenExpiry;
  String refreshToken;
  String refreshTokenExpiry;
  Store store;

  Login_store({
    required this.sessionId,
    required this.accessToken,
    required this.AcessTokenExpiry,
    required this.refreshToken,
    required this.refreshTokenExpiry,
    required this.store,
  });

  factory Login_store.fromJson(Map<String, dynamic> json) => Login_store(
        sessionId: json["session_id"],
        accessToken: json["access_token"],
        AcessTokenExpiry: json["access_token_expires_at"],
        refreshToken: json["refresh_token"],
        refreshTokenExpiry: json["refresh_token_expires_at"],
        store: Store.fromJson(json["store"]),
      );
}

class Store {
  int id;
  String name;
  String address;
  String contactEmail;
  String contactPhone;
  String createdAt;

  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.contactEmail,
    required this.contactPhone,
    required this.createdAt,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        contactEmail: json["contactEmail"],
        contactPhone: json["contactPhone"],
        createdAt: json["createdAt"],
      );
}

class StoreInputsLogin {
  String _email = "";

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String _password = "";

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class StoreInputsRegister {
  String _name = "";

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String _address = "";

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String _contactEmail = "";

  String get contactEmail => _contactEmail;

  set contactEmail(String value) {
    _contactEmail = value;
  }

  String _contactPhone = "";

  String get contactPhone => _contactPhone;

  set contactPhone(String value) {
    _contactPhone = value;
  }

  String _hashedPassword = "";

  String get hashedPassword => _hashedPassword;

  set hashedPassword(String value) {
    _hashedPassword = value;
  }
}
