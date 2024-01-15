class PunchOutModle {
  String? empId;
  String? punchOutImage;
  String? attendanceDate;
  String? punchOutLatitude;
  String? punchOutLongitude;
  String? punchInImage;
  String? punchIn;
  String? punchOut;


  PunchOutModle(
      {this.empId,
        this.punchOutImage,
        this.attendanceDate,
        this.punchOutLatitude,
        this.punchOutLongitude,
        this.punchInImage,
        this.punchIn,
        this.punchOut});

  PunchOutModle.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    punchOutImage = json['punchOutImage'];
    attendanceDate = json['attendanceDate'];
    punchOutLatitude = json['punchOutLatitude'];
    punchOutLongitude = json['punchOutLongitude'];
    punchInImage = json['punchInImage'];
    punchIn = json['punchIn'];
    punchOut = json['punchOut'];
  }

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empId'] = this.empId;
    data['punchOutImage'] = this.punchOutImage;
    data['attendanceDate'] = this.attendanceDate;
    data['punchOutLatitude'] = this.punchOutLatitude;
    data['punchOutLongitude'] = this.punchOutLongitude;
    data['punchInImage'] = this.punchInImage;
    data['punchIn'] = this.punchIn;
    data['punchOut'] = this.punchOut;
    return data;
  }
}
