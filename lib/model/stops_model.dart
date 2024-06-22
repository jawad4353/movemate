class BusStop {
  String id;
  String stopName;
  List<double> coordinates;

  BusStop({
    required this.id,
    required this.stopName,
    required this.coordinates,
  });

  factory BusStop.fromJson(Map<String, dynamic> json) {
    return BusStop(
      id: json['id'],
      stopName: json['stopName'],
      coordinates: List<double>.from(json['coordinates'].map((x) => x.toDouble())),
    );
  }
}

class BusStopListModel {
  List<BusStop> busStops;

  BusStopListModel({
    required this.busStops,
  });

  factory BusStopListModel.fromJson(List<dynamic> json) {
    return BusStopListModel(
      busStops: List<BusStop>.from(json.map((stop) => BusStop.fromJson(stop))),
    );
  }
}
