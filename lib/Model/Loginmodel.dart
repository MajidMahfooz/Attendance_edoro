

class Modellogin {
  String? userName;
  String? userEmail;
  String? userPhone;
  List<CompanyDetails>? companyDetails;
  String? userId;
  String? userStatus;

  Modellogin(
      {this.userName,
        this.userEmail,
        this.userPhone,
        this.companyDetails,
        this.userId,
        this.userStatus});

  Modellogin.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    if (json['companyDetails'] != null) {
      companyDetails = <CompanyDetails>[];
      json['companyDetails'].forEach((v) {
        companyDetails!.add(new CompanyDetails.fromJson(v));
      });
    }
    userId = json['userId'];
    userStatus = json['userStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    if (this.companyDetails != null) {
      data['companyDetails'] =
          this.companyDetails!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this.userId;
    data['userStatus'] = this.userStatus;
    return data;
  }
}

class CompanyDetails {
  String? companyId;
  String? companyRegNo;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  String? companyAddress;
  String? cameraStatus;
  String? companyIdentifier;
  String? companyImage;

  CompanyDetails(
      {this.companyId,
        this.companyRegNo,
        this.companyName,
        this.companyEmail,
        this.companyPhone,
        this.companyAddress,
        this.cameraStatus,
        this.companyIdentifier,
        this.companyImage});

  CompanyDetails.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    companyRegNo = json['companyRegNo'];
    companyName = json['companyName'];
    companyEmail = json['companyEmail'];
    companyPhone = json['companyPhone'];
    companyAddress = json['companyAddress'];
    cameraStatus = json['cameraStatus'];
    companyIdentifier = json['companyIdentifier'];
    companyImage = json['companyImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['companyRegNo'] = this.companyRegNo;
    data['companyName'] = this.companyName;
    data['companyEmail'] = this.companyEmail;
    data['companyPhone'] = this.companyPhone;
    data['companyAddress'] = this.companyAddress;
    data['cameraStatus'] = this.cameraStatus;
    data['companyIdentifier'] = this.companyIdentifier;
    data['companyImage'] = this.companyImage;
    return data;
  }
}

