# UNOFFICIAL API WRAPPER FOR NUS NEXTBUS 

Simple wrapper for nus next bus api.
A port from the old library to be compliant wih dart style guide


```$xslt
abstract class NusNextbusInternalApiInterface {
  Future<BusStopTimingsApi> getBusStopTimings(String busStopCode);
  Future<List<BusStopApi>> getBusStops();
  Future<RouteApi> getRoute(String serviceName);
}
```