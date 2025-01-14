class Readings {
  // final String babyTemp;
  // final String babyHeartRate;
  // final String babyOxygenLevel;
  final String incubatorTemp;
  final String incubatorHumidity;

  Readings({
    // required this.babyTemp,
    // required this.babyHeartRate,
    // required this.babyOxygenLevel,
    required this.incubatorTemp,
    required this.incubatorHumidity,
  });

  factory Readings.fromJson(Map<String, dynamic> json) {
    return Readings(
      // babyTemp: json['babyTemperature'],
      // babyHeartRate: json['heartRate'],
      // babyOxygenLevel: json['spO2'],
      incubatorTemp: json['temperature'],
      incubatorHumidity: json['humidity'],
    );
  }
}
