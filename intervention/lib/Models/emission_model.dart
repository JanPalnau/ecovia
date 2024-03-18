class EmissionStatistics {
  String? vegetables, fruits, meat;

  EmissionStatistics({this.vegetables, this.fruits, this.meat});

  EmissionStatistics.fromJson(Map<String, dynamic> parsedJSON)
    : vegetables = parsedJSON['vegetables'],
      fruits = parsedJSON['fruits'],
      meat = parsedJSON['meat'];
}
