import 'dart:async';

Future<String> fetchWeather() async {
  await Future.delayed(Duration(seconds: 3)); // simulate network delay
  return "Temperature: 28°C, Condition: Sunny";
}

Future<void> loadWeather() async {
  try {
    print("Connecting to weather server...");
    await Future.delayed(Duration(seconds: 1));

    print("Fetching weather data...");
    String weatherData = await fetchWeather();

    print("Weather data loaded successfully.\n");
    print(weatherData);
  } catch (e) {
    print("Failed to load weather data.");
    print(e);
  }
}
