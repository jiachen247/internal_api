import 'package:nus_nextbus_internal_api/src/models/bus_stop_api.dart';

class BusStopsParser {

	static BusStopApi parseStop(Map stop){
		return BusStopApi(
			stop["caption"],
			stop["latitude"],
			stop["longitude"],
			stop["name"]
		);
	}

	static List<BusStopApi> parse(Map data){
		List<BusStopApi> results = [];
		List busStopsJson = data["BusStopsResult"]["busstops"];

		busStopsJson.forEach((s) => results.add(parseStop(s)));
		print("[+] Bus Stops parsing success. length=${results.length}");
		return results;
	}
}
