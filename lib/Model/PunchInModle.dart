class PunchInModle {
  String? empId;
  String? punchInImage;
  String? punchOutImage;
  String? punchIn;
  String? punchOut;
  String? attendanceDate;
  String? punchInLatitude;
  String? punchInLongitude;

  PunchInModle(
      {this.empId,
        this.punchInImage,
        this.punchOutImage,
        this.punchIn,
        this.punchOut,
        this.attendanceDate,
        this.punchInLatitude,
        this.punchInLongitude});

  PunchInModle.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    punchInImage = json['punchInImage'];
    punchOutImage = json['punchOutImage'];
    punchIn = json['punchIn'];
    punchOut = json['punchOut'];
    attendanceDate = json['attendanceDate'];
    punchInLatitude = json['punchInLatitude'];
    punchInLongitude = json['punchInLongitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empId'] = this.empId;
    data['punchInImage'] = this.punchInImage;
    data['punchOutImage'] = this.punchOutImage;
    data['punchIn'] = this.punchIn;
    data['punchOut'] = this.punchOut;
    data['attendanceDate'] = this.attendanceDate;
    data['punchInLatitude'] = this.punchInLatitude;
    data['punchInLongitude'] = this.punchInLongitude;
    return data;
  }
}
