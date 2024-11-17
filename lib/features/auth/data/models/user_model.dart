class UserDataModel {
  late String name;
  late String email;
  late String image;

  UserDataModel({
    required this.name,
    required this.email,
    required this.image,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
