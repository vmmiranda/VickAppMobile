class UserModel {
  int id = 0;
  String name = "";
  String username = "";
  String email = "";

  UserModel(int id, String name, String username, String email) {
    this.id = id;
    this.name = name;
    this.username = username;
    this.email = email;
  }
  UserModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'];
}
