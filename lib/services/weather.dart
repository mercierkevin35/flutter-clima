import '../location.dart';
import '../services/networking.dart';
import '../utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$kAPIURL?lang=fr&lat=${location.latitude.toStringAsFixed(5)}&lon=${location.longitude.toStringAsFixed(5)}&appid=$kAPIKey&units=metric");
    var datas = await networkHelper.getData();
    return datas;
  }

  Future<dynamic> getCityWeather(String city) async {
    String url = '$kAPIURL?q=$city&appid=$kAPIKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherDatas = await networkHelper.getData();
    return weatherDatas;
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
