class LoginModle {
  String? responseMessage;
  String? responseCode;
  ResponseData? responseData;

  

  LoginModle({this.responseMessage, this.responseCode, this.responseData});

  LoginModle.fromJson(Map<String, dynamic> json) {
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
  }

  get companyDetails => companyDetails;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseMessage'] = this.responseMessage;
    data['responseCode'] = this.responseCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? userName;
  String? userEmail;
  String? userPhone;
  List<CompanyDetails>? companyDetails;
  String? userId;
  String? userStatus;

  ResponseData(
      {this.userName,
        this.userEmail,
        this.userPhone,
        this.companyDetails,
        this.userId,
        this.userStatus});

  ResponseData.fromJson(Map<String, dynamic> json) {
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
  String? cameraStatus;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  String? companyIdentifier;
  String? companyAddress;
  String? companyImage;

  CompanyDetails(
      {this.companyId,
        this.companyRegNo,
        this.cameraStatus,
        this.companyName,
        this.companyEmail,
        this.companyPhone,
        this.companyIdentifier,
        this.companyAddress,
        this.companyImage});

  CompanyDetails.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    companyRegNo = json['companyRegNo'];
    cameraStatus = json['cameraStatus'];
    companyName = json['companyName'];
    companyEmail = json['companyEmail'];
    companyPhone = json['companyPhone'];
    companyIdentifier = json['companyIdentifier'];
    companyAddress = json['companyAddress'];
    companyImage = json['companyImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['companyRegNo'] = this.companyRegNo;
    data['cameraStatus'] = this.cameraStatus;
    data['companyName'] = this.companyName;
    data['companyEmail'] = this.companyEmail;
    data['companyPhone'] = this.companyPhone;
    data['companyIdentifier'] = this.companyIdentifier;
    data['companyAddress'] = this.companyAddress;
    data['companyImage'] = this.companyImage;
    return data;
  }
}
