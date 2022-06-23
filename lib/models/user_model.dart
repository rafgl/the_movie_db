class UserModel {
  int? id;
  String? email;
  String? avatar;
  bool? subscriber;
  int? admin;
  int? developer;
  int? blocked;
  bool? verified;
  bool? hasFacebook;
  bool? hasGoogle;
  Profile? profile;
  bool? vacination;

  UserModel(
      {this.id,
      this.email,
      this.subscriber,
      this.admin,
      this.developer,
      this.blocked,
      this.verified,
      this.hasFacebook,
      this.hasGoogle,
      this.profile,
      this.vacination});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    subscriber = json['subscriber'];
    admin = json['admin'];
    developer = json['developer'];
    blocked = json['blocked'];
    verified = json['verified'];
    hasFacebook = json['has_facebook'];
    hasGoogle = json['has_google'];
    vacination = json['vacination'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['subscriber'] = this.subscriber;
    data['admin'] = this.admin;
    data['developer'] = this.developer;
    data['blocked'] = this.blocked;
    data['verified'] = this.verified;
    data['has_facebook'] = this.hasFacebook;
    data['has_google'] = this.hasGoogle;
    data['vacination'] = this.vacination;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  // ignore: non_constant_identifier_names
  int? UserModelId;
  // ignore: unnecessary_question_mark
  dynamic? name;
  // ignore: unnecessary_question_mark
  dynamic? cpf;
  // ignore: unnecessary_question_mark
  dynamic? avatar;
  // ignore: unnecessary_question_mark
  dynamic? gender;
  // ignore: unnecessary_question_mark
  dynamic? phone;
  // ignore: unnecessary_question_mark
  dynamic? birthday;
  // ignore: unnecessary_question_mark
  dynamic? createdAt;
  // ignore: unnecessary_question_mark
  dynamic? updatedAt;
  bool? hasBillingAddress;
  // ignore: unnecessary_question_mark
  dynamic? formattedPhone;

  Profile(
      {this.id,
      // ignore: non_constant_identifier_names
      this.UserModelId,
      this.name,
      this.cpf,
      this.avatar,
      this.gender,
      this.phone,
      this.birthday,
      this.createdAt,
      this.updatedAt,
      this.hasBillingAddress,
      this.formattedPhone});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    UserModelId = json['UserModel_id'];
    name = json['name'];
    cpf = json['cpf'];
    avatar = json['avatar'];
    gender = json['gender'];
    phone = json['phone'];
    birthday = json['birthday'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hasBillingAddress = json['has_billing_address'];
    formattedPhone = json['formatted_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['UserModel_id'] = this.UserModelId;
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['has_billing_address'] = this.hasBillingAddress;
    data['formatted_phone'] = this.formattedPhone;
    return data;
  }
}
