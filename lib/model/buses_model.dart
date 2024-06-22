class BusesModel {
  final List<Bus> buses;

  BusesModel({required this.buses});

  factory BusesModel.fromJson(List<dynamic> json) {
    List<Bus> buses = json.map((busJson) => Bus.fromJson(busJson)).toList();
    return BusesModel(buses: buses);
  }
}

class Bus {
  final String license;
  final List<String> stops;
  final List<String> departureTimes;
  final List<String> fridayDepartureTimes;

  Bus({
    required this.license,
    required this.stops,
    required this.departureTimes,
    required this.fridayDepartureTimes,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      license: json['licence'],
      stops: List<String>.from(json['stops']),
      departureTimes: List<String>.from(json['departureTimes']),
      fridayDepartureTimes: List<String>.from(json['fridayDepartureTimes']),
    );
  }
}
