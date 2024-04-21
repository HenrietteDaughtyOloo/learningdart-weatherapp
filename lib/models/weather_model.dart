class Weather{
  final String cityName;
  final double temperature;
  final String generalisedCondition;

  Weather({required this.cityName, required this.temperature, required this.generalisedCondition});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      cityName: json['name'],
      temperature: json[ 'main']['temp'].toDouble(),
      generalisedCondition: json['weather'][0]['main'],
    );
  }
} 