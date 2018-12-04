class RouteApi {
	final String serviceName;
	final List<RouteStopApi> routeStops = [];

	RouteApi(this.serviceName);

	@override
	String toString() => "!!! BusStops Object | serviceName= ${serviceName} size=${routeStops.length}";
}

class RouteStopApi {
  final String stopName;
  final int routeId;
  final String busStopCode;
  final double latitude;
  final double longitude;

  RouteStopApi(this.stopName, this.routeId, this.busStopCode, this.latitude,
      this.longitude);

  @override
  String toString() =>
      "!!! RouteStop object. ${stopName} ${routeId} ${busStopCode} ${latitude} ${longitude}";
}
