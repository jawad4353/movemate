class BusRouteModel {
  String id;
  String name;
  String startingPoint;
  String endingPoint;
  List<BusStop> stops;
  BusSchedule schedule;

  BusRouteModel({
    required this.id,
    required this.name,
    required this.startingPoint,
    required this.endingPoint,
    required this.stops,
    required this.schedule,
  });

  factory BusRouteModel.fromJson(Map<String, dynamic> json) {
    return BusRouteModel(
      id: json['_id'],
      name: json['name'],
      startingPoint: json['startingPoint'],
      endingPoint: json['endingPoint'],
      stops: List<BusStop>.from(json['stops'].map((x) => BusStop.fromJson(x))),
      schedule: BusSchedule.fromJson(json['schedule']),
    );
  }
}

class BusStop {
  String id;
  String stopName;

  BusStop({
    required this.id,
    required this.stopName,
  });

  factory BusStop.fromJson(Map<String, dynamic> json) {
    return BusStop(
      id: json['_id'],
      stopName: json['stopName'],
    );
  }
}

class BusSchedule {
  String id;
  List<String> departureTimes;
  List<String> fridayDepartureTimes;

  BusSchedule({
    required this.id,
    required this.departureTimes,
    required this.fridayDepartureTimes,
  });

  factory BusSchedule.fromJson(Map<String, dynamic> json) {
    return BusSchedule(
      id: json['_id'],
      departureTimes: List<String>.from(json['departureTimes']),
      fridayDepartureTimes: List<String>.from(json['fridayDepartureTimes']),
    );
  }
}

class BusRouteList {
  List<BusRouteModel> routes;

  BusRouteList({
    required this.routes,
  });

  factory BusRouteList.fromJson(List<dynamic> json) {
    return BusRouteList(
      routes: List<BusRouteModel>.from(json.map((route) => BusRouteModel.fromJson(route))),
    );
  }
}
