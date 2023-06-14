class Login_store {
  int sessionId;
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
        sessionId: json["sessionId"],
        accessToken: json["accessToken"],
        AcessTokenExpiry: json["AcessTokenExpiry"],
        refreshToken: json["refreshToken"],
        refreshTokenExpiry: json["refreshTokenExpiry"],
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
