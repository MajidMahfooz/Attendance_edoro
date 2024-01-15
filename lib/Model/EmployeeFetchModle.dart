class EmployeeFetchModle {
  String? empId;
  String? empName;
  String? empImage;
  String? employeeId;
  String? cameraStatus;
  String? punchType;
  String? attendanceDate;
  String? currentDate;

  static var companyId;

  EmployeeFetchModle(
      {this.empId,
        this.empName,
        this.empImage,
        this.employeeId,
        this.cameraStatus,
        this.punchType,
        this.attendanceDate,
        this.currentDate});

  EmployeeFetchModle.fromJson(Map<String, dynamic> json) {
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
