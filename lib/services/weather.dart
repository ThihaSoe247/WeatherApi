import 'networking.dart';
import 'location.dart';


const apikey = "b46324b34ae1dade5120b5ab629e40ec";
const openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";


class WeatherModel {

  Future<dynamic> getByCity(String city) async{
    var url = '$openWeatherMapUrl?q=${city}&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData =await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async{
    Location locator = Location();
    await locator.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${locator.latitude}&lon=${locator.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
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
