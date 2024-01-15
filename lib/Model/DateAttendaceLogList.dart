class DateAttendanceLogList {
  List<EmployeeAttendanceList>? employeeAttendanceList;
  String? empName;
  String? workHour;
  String? attendanceDate;
  String? employeeId;
  String? empImage;

  DateAttendanceLogList(
      {this.employeeAttendanceList,
        this.empName,
        this.workHour,
        this.attendanceDate,
        this.employeeId,
        this.empImage});

  DateAttendanceLogList.fromJson(Map<String, dynamic> json) {
    if (json['employeeAttendanceList'] != null) {
      employeeAttendanceList = <EmployeeAttendanceList>[];
      json['employeeAttendanceList'].forEach((v) {
        employeeAttendanceList!.add(new EmployeeAttendanceList.fromJson(v));
      });
    }
    empName = json['empName'];
    workHour = json['workHour'];
    attendanceDate = json['attendanceDate'];
    employeeId = json['employeeId'];
    empImage = json['empImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeeAttendanceList != null) {
      data['employeeAttendanceList'] =
          this.employeeAttendanceList!.map((v) => v.toJson()).toList();
    }
    data['empName'] = this.empName;
    data['workHour'] = this.workHour;
    data['attendanceDate'] = this.attendanceDate;
    data['employeeId'] = this.employeeId;
    data['empImage'] = this.empImage;
    return data;
  }
}

class EmployeeAttendanceList {
  String? type;
  String? attendanceId;
  String? imageURL;
  String? attDatetime;
  String? punchOutLatitude;
  String? punchOutLongitude;
  String? remark;
  String? punchInLatitude;
  String? punchInLongitude;
  String? adminRemark;

  EmployeeAttendanceList(
      {this.type,
        this.attendanceId,
        this.imageURL,
        this.attDatetime,
        this.punchOutLatitude,
        this.punchOutLongitude,
        this.remark,
        this.punchInLatitude,
        this.punchInLongitude,
        this.adminRemark});

  EmployeeAttendanceList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    attendanceId = json['attendanceId'];
    imageURL = json['imageURL'];
    attDatetime = json['att_datetime'];
    punchOutLatitude = json['punchOutLatitude'];
    punchOutLongitude = json['punchOutLongitude'];
    remark = json['remark'];
    punchInLatitude = json['punchInLatitude'];
    punchInLongitude = json['punchInLongitude'];
    adminRemark = json['admin_remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['attendanceId'] = this.attendanceId;
    data['imageURL'] = this.imageURL;
    data['att_datetime'] = this.attDatetime;
    data['punchOutLatitude'] = this.punchOutLatitude;
    data['punchOutLongitude'] = this.punchOutLongitude;
    data['remark'] = this.remark;
    data['punchInLatitude'] = this.punchInLatitude;
    data['punchInLongitude'] = this.punchInLongitude;
    data['admin_remark'] = this.adminRemark;
    return data;
  }
}
