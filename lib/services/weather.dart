import 'location.dart';
import 'networking.dart';
import '../utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationWeatherData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    print('${loc.latitude}, ${loc.longitude}');

    var jsonData = await NetworkHelper(
            '$openWeatherMapUrl?lat=${loc.latitude}&lon=${loc.longitude}&units=metric&appid=$apiKey')
        .getData();
    return jsonData;
  }

  Future<dynamic> getCityWeatherData({required String cityName}) async {
    var jsonData = await NetworkHelper(
            '$openWeatherMapUrl?q=$cityName&units=metric&appid=$apiKey')
        .getData();
    return jsonData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
