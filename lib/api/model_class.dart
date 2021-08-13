class MyModelClass {
  String? username;
  String? phoneNo;
  String? countryCode;
  String? image;
  String? email;
  String? firebaseId;

  MyModelClass(
      {this.username,
        this.phoneNo,
        this.countryCode,
        this.image,
        this.email,
        this.firebaseId});

  MyModelClass.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phoneNo = json['phone_no'];
    countryCode = json['country_code'];
    image = json['image'];
    email = json['email'];
    firebaseId = json['firebase_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['phone_no'] = this.phoneNo;
    data['country_code'] = this.countryCode;
    data['image'] = this.image;
    data['email'] = this.email;
    data['firebase_id'] = this.firebaseId;
    return data;
  }
}