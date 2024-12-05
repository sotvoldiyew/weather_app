class AssistModel {
  AssistModel({
    required this.currentTime,
    required this.currentTemp,
    required this.currentWindspeed,
    required this.currentCode,
    required this.dailyTime,
    required this.dailyMax,
    required this.dailyMin,
    required this.dailyCode,
    required this.hourlyTime,
    required this.hourlyTemp,
    required this.hourlyCode,
  });

  final String currentTime;
  final double currentTemp;
  final double currentWindspeed;
  final int currentCode;
  final List dailyTime;
  final List dailyMax;
  final List dailyMin;
  final List dailyCode;
  final List hourlyTime;
  final List hourlyTemp;
  final List hourlyCode;

  static AssistModel fromJson(Map<String, Object?> json) {
    Model model = Model.fromJson(json);
    return AssistModel(
      currentTime: model.currentWeather["time"] as String,
      currentTemp: model.currentWeather["temperature"] as double,
      currentWindspeed: model.currentWeather["windspeed"] as double,
      currentCode: model.currentWeather["weathercode"] as int,
      dailyTime: model.daily["time"] as List,
      dailyMax: model.daily["temperature_2m_max"] as List,
      dailyMin: model.daily["temperature_2m_min"] as List,
      dailyCode: model.daily["weather_code"] as List,
      hourlyTime: model.hourly["time"] as List,
      hourlyTemp: model.hourly["temperature_2m"] as List,
      hourlyCode: model.hourly["weather_code"] as List,
    );
  }
}

class Model {
  Model({
    required this.currentWeather,
    required this.daily,
    required this.hourly,
  });

  final Map<String, Object?> currentWeather;
  final Map<String, Object?> daily;
  final Map<String, Object?> hourly;

  static Model fromJson(Map<String, Object?> json) {
    return Model(
      currentWeather: json["current_weather"] as Map<String, Object?>,
      daily: json["daily"] as Map<String, Object?>,
      hourly: json["hourly"] as Map<String, Object?>,
    );
  }
}
