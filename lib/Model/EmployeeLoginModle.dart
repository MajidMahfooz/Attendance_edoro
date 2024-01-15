class EmployeeLoginModle {
  String? responseMessage;
  String? responseCode;
  ResponseData? responseData;

  EmployeeLoginModle(
      {this.responseMessage, this.responseCode, this.responseData});

  EmployeeLoginModle.fromJson(Map<String, dynamic> json) {
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
  }

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
  String? empId;
  String? empName;
  String? empImage;
  String? employeeId;
  String? cameraStatus;
  String? punchType;
  String? attendanceDate;
  String? currentDate;

  ResponseData(
      {this.empId,
        this.empName,
        this.empImage,
        this.employeeId,
        this.cameraStatus,
        this.punchType,
        this.attendanceDate,
        this.currentDate});

  ResponseData.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    empName = json['empName'];
    empImage = json['empImage'];
    employeeId = json['employeeId'];
    cameraStatus = json['cameraStatus'];
    punchType = json['punchType'];
    attendanceDate = json['attendanceDate'];
    currentDate = json['currentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empId'] = this.empId;
    data['empName'] = this.empName;
    data['empImage'] = this.empImage;
    data['employeeId'] = this.employeeId;
    data['cameraStatus'] = this.cameraStatus;
    data['punchType'] = this.punchType;
    data['attendanceDate'] = this.attendanceDate;
    data['currentDate'] = this.currentDate;
    return data;
  }
}
