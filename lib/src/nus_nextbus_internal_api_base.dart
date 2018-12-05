
import 'package:nus_nextbus_internal_api/src/models/bus_stop_api.dart';
import 'package:nus_nextbus_internal_api/src/models/route_api.dart';
import 'package:nus_nextbus_internal_api/src/models/timing_api.dart';
import 'package:nus_nextbus_internal_api/src/api/api.dart';




abstract class NusNextbusInternalApiInterface {
  Future<BusStopTimingsApi> getBusStopTimings(String busStopCode);
  Future<List<BusStopApi>> getBusStops();
  Future<RouteApi> getRoute(String serviceName);
}

class NusNextbusInternalApi extends NusNextbusInternalApiInterface {
  Api _api = Api();


  @override
  Future<List<BusStopApi>> getBusStops() => _api.getBusStops();

  @override
  Future<RouteApi> getRoute(String serviceName) => _api.getRoute(serviceName);

  @override
  Future<BusStopTimingsApi> getBusStopTimings(String busStopCode) =>
      _api.getBusStopTimings(busStopCode);



}

