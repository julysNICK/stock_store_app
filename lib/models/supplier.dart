class Supplier {
  int id;
  String name;
  String address;
  String email;
  String contactPhone;
  //created_at
  String createdAt;

  Supplier({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.contactPhone,
    required this.createdAt,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        contactPhone: json["contactPhone"],
        createdAt: json["createdAt"],
      );
}
