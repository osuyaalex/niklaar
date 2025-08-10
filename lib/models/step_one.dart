class StepOne {
  String? status;
  Data? data;

  StepOne({this.status, this.data});

  StepOne.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? message;
  Null? nId;
  User? user;
  String? accessToken;
  String? tokenType;

  Data({this.message, this.nId, this.user, this.accessToken, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    nId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['_id'] = this.nId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? surname;
  String? otherName;
  String? username;
  String? phoneNumber;
  String? email;
  String? dob;
  String? accountNumber;
  Null? accountName;
  Null? bankName;
  String? isNomba;
  String? balance;
  String? accountLevel;
  String? isAccountRestricted;
  String? isWithCard;
  Null? levelTwoKycStatus;
  Null? levelTwoRejectedStatus;
  Null? levelThreeKycStatus;
  Null? levelThreeRejectedStatus;
  Null? passport;
  String? profile;
  Null? gender;
  Null? preBvn;
  Null? bvn;
  String? isBvnVerified;
  Null? address;
  String? emailVerifiedAt;
  String? view;
  String? isBan;
  Null? referral;
  Null? code;
  String? complete;
  Null? deviceToken;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.firstName,
        this.surname,
        this.otherName,
        this.username,
        this.phoneNumber,
        this.email,
        this.dob,
        this.accountNumber,
        this.accountName,
        this.bankName,
        this.isNomba,
        this.balance,
        this.accountLevel,
        this.isAccountRestricted,
        this.isWithCard,
        this.levelTwoKycStatus,
        this.levelTwoRejectedStatus,
        this.levelThreeKycStatus,
        this.levelThreeRejectedStatus,
        this.passport,
        this.profile,
        this.gender,
        this.preBvn,
        this.bvn,
        this.isBvnVerified,
        this.address,
        this.emailVerifiedAt,
        this.view,
        this.isBan,
        this.referral,
        this.code,
        this.complete,
        this.deviceToken,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    surname = json['surname'];
    otherName = json['other_name'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    dob = json['dob'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    bankName = json['bank_name'];
    isNomba = json['is_nomba'];
    balance = json['balance'];
    accountLevel = json['account_level'];
    isAccountRestricted = json['is_account_restricted'];
    isWithCard = json['is_with_card'];
    levelTwoKycStatus = json['level_two_kyc_status'];
    levelTwoRejectedStatus = json['level_two_rejected_status'];
    levelThreeKycStatus = json['level_three_kyc_status'];
    levelThreeRejectedStatus = json['level_three_rejected_status'];
    passport = json['passport'];
    profile = json['profile'];
    gender = json['gender'];
    preBvn = json['pre_bvn'];
    bvn = json['bvn'];
    isBvnVerified = json['is_bvn_verified'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    view = json['view'];
    isBan = json['is_ban'];
    referral = json['referral'];
    code = json['code'];
    complete = json['complete'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['surname'] = this.surname;
    data['other_name'] = this.otherName;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['account_number'] = this.accountNumber;
    data['account_name'] = this.accountName;
    data['bank_name'] = this.bankName;
    data['is_nomba'] = this.isNomba;
    data['balance'] = this.balance;
    data['account_level'] = this.accountLevel;
    data['is_account_restricted'] = this.isAccountRestricted;
    data['is_with_card'] = this.isWithCard;
    data['level_two_kyc_status'] = this.levelTwoKycStatus;
    data['level_two_rejected_status'] = this.levelTwoRejectedStatus;
    data['level_three_kyc_status'] = this.levelThreeKycStatus;
    data['level_three_rejected_status'] = this.levelThreeRejectedStatus;
    data['passport'] = this.passport;
    data['profile'] = this.profile;
    data['gender'] = this.gender;
    data['pre_bvn'] = this.preBvn;
    data['bvn'] = this.bvn;
    data['is_bvn_verified'] = this.isBvnVerified;
    data['address'] = this.address;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['view'] = this.view;
    data['is_ban'] = this.isBan;
    data['referral'] = this.referral;
    data['code'] = this.code;
    data['complete'] = this.complete;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
