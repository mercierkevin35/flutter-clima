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
