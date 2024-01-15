class attendmodel {
  List<AttendanceLog>? attendanceLog;
  String? empId;
  String? employeeId;
  String? empName;
  String? empImage;
  String? monthWorkHour;

  attendmodel(
      {this.attendanceLog,
        this.empId,
        this.employeeId,
        this.empName,
        this.empImage,
        this.monthWorkHour});

  attendmodel.fromJson(Map<String, dynamic> json) {
    if (json['attendanceLog'] != null) {
      attendanceLog = <AttendanceLog>[];
      json['attendanceLog'].forEach((v) {
        attendanceLog!.add(new AttendanceLog.fromJson(v));
      });
    }
    empId = json['empId'];
    employeeId = json['employeeId'];
    empName = json['empName'];
    empImage = json['empImage'];
    monthWorkHour = json['monthWorkHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendanceLog != null) {
      data['attendanceLog'] =
          this.attendanceLog!.map((v) => v.toJson()).toList();
    }
    data['empId'] = this.empId;
    data['employeeId'] = this.employeeId;
    data['empName'] = this.empName;
    data['empImage'] = this.empImage;
    data['monthWorkHour'] = this.monthWorkHour;
    return data;
  }
}

class AttendanceLog {
  String? attendanceDate;
  String? workHour;
  String? totalPunchIn;

  AttendanceLog({this.attendanceDate, this.workHour, this.totalPunchIn});

  AttendanceLog.fromJson(Map<String, dynamic> json) {
    attendanceDate = json['attendanceDate'];
    workHour = json['workHour'];
    totalPunchIn = json['totalPunchIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendanceDate'] = this.attendanceDate;
    data['workHour'] = this.workHour;
    data['totalPunchIn'] = this.totalPunchIn;
    return data;
  }
}
