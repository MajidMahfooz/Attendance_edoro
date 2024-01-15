class AttLogListModle {
  List<EmployeeAttendanceList>? employeeAttendanceList;

  AttLogListModle({this.employeeAttendanceList});

  AttLogListModle.fromJson(Map<String, dynamic> json) {
    if (json['employeeAttendanceList'] != null) {
      employeeAttendanceList = <EmployeeAttendanceList>[];
      json['employeeAttendanceList'].forEach((v) {
        employeeAttendanceList!.add(new EmployeeAttendanceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeeAttendanceList != null) {
      data['employeeAttendanceList'] =
          this.employeeAttendanceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeAttendanceList {
  String? empId;
  String? empName;
  String? empEmail;
  String? attendanceId;
  String? punchIn;
  String? punchOut;
  String? workHour;
  String? punchInLatitude;
  String? punchInLongitude;
  String? punchOutLatitude;
  String? punchOutLongitude;
  String? employeeId;
  String? shiftId;
  String? punchInImage;
  String? punchOutImage;
  String? startTime;
  String? endTime;
  String? shiftName;

  EmployeeAttendanceList(
      {this.empId,
        this.empName,
        this.empEmail,
        this.attendanceId,
        this.punchIn,
        this.punchOut,
        this.workHour,
        this.punchInLatitude,
        this.punchInLongitude,
        this.punchOutLatitude,
        this.punchOutLongitude,
        this.employeeId,
        this.shiftId,
        this.punchInImage,
        this.punchOutImage,
        this.startTime,
        this.endTime,
        this.shiftName});

  EmployeeAttendanceList.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    empName = json['empName'];
    empEmail = json['empEmail'];
    attendanceId = json['attendanceId'];
    punchIn = json['punchIn'];
    punchOut = json['punchOut'];
    workHour = json['workHour'];
    punchInLatitude = json['punchInLatitude'];
    punchInLongitude = json['punchInLongitude'];
    punchOutLatitude = json['punchOutLatitude'];
    punchOutLongitude = json['punchOutLongitude'];
    employeeId = json['employeeId'];
    shiftId = json['shiftId'];
    punchInImage = json['punchInImage'];
    punchOutImage = json['punchOutImage'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    shiftName = json['shiftName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empId'] = this.empId;
    data['empName'] = this.empName;
    data['empEmail'] = this.empEmail;
    data['attendanceId'] = this.attendanceId;
    data['punchIn'] = this.punchIn;
    data['punchOut'] = this.punchOut;
    data['workHour'] = this.workHour;
    data['punchInLatitude'] = this.punchInLatitude;
    data['punchInLongitude'] = this.punchInLongitude;
    data['punchOutLatitude'] = this.punchOutLatitude;
    data['punchOutLongitude'] = this.punchOutLongitude;
    data['employeeId'] = this.employeeId;
    data['shiftId'] = this.shiftId;
    data['punchInImage'] = this.punchInImage;
    data['punchOutImage'] = this.punchOutImage;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['shiftName'] = this.shiftName;
    return data;
  }
}
