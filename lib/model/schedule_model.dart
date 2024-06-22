class ScheduleModel {
  ScheduleModel({
    required this.id,
    required this.campusName,
    required this.departureTimes,
    required this.fridayDepartureTimes,
  });

  final String? id;
  final String? campusName;
  final List<String> departureTimes;
  final List<String> fridayDepartureTimes;

  factory ScheduleModel.fromJson(Map<String, dynamic> json){
    return ScheduleModel(
      id: json["id"],
      campusName: json["campusName"],
      departureTimes: json["departureTimes"] == null ? [] : List<String>.from(json["departureTimes"]!.map((x) => x)),
      fridayDepartureTimes: json["fridayDepartureTimes"] == null ? [] : List<String>.from(json["fridayDepartureTimes"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "campusName": campusName,
    "departureTimes": departureTimes.map((x) => x).toList(),
    "fridayDepartureTimes": fridayDepartureTimes.map((x) => x).toList(),
  };

}
