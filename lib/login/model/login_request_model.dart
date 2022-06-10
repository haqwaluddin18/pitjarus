class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    this.username = json["username"];
    this.password = json["Password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.username;
    data["Password"] = this.password;
    return data;
  }
}