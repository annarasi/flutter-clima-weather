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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
