import 'package:nus_nextbus_internal_api/models/timing_api.dart';

class TimingParser {

	static TimingApi parseTiming(Map timing){
		return TimingApi(timing["name"], timing["arrivalTime"], timing["nextArrivalTime"]);
	}

  static BusStopTimingsApi parse(String busStopCode, Map data) {
//		return BusStopTimingsApi(busStopCode);

    BusStopTimingsApi timings = BusStopTimingsApi(busStopCode);
    String name = data["ShuttleServiceResult"]["name"];
    if (name == null) {
      print("[!!!] Error. Bus Stop (${busStopCode}) does not exist.");
      return timings;
    }

    // *** dart 2.0 problem | needs explicit casting
    List<Map> jsonTimings =
        new List<Map>.from(data["ShuttleServiceResult"]["shuttles"]);

    if (jsonTimings == null || jsonTimings.isEmpty) {
      print("[-] No buses currenlty operating from this bus stop.");
      return timings;
    }

    jsonTimings.forEach((Map jsonShuttle) =>
        timings.timings.add(parseTiming(jsonShuttle)));

    print("[+] BusStops parsing success. length=${timings.timings.length}");
    return timings;
  }
}
