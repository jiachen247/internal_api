import 'package:nus_nextbus_internal_api/internal_api.dart';

main() async {

	var _api = NusNextbusInternalApi();


	List<BusStopApi> allBusStops = await _api.getBusStops();
    print("[+] this are all the bus stops...");
	print(allBusStops);

	String serviceName = "A1";
	RouteApi route = await _api.getRoute(serviceName);
	print("[+] this is the route for ${serviceName}...");
	print(route);

	String busStopCode = "PGPT";
	BusStopTimingsApi busStopTimings = await _api.getBusStopTimings(busStopCode);
	print("[+] this is the bus timings for PGPT...");
	print(busStopTimings);
	busStopTimings.timings.forEach(print);

}