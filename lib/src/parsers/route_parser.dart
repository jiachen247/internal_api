import 'package:nus_nextbus_internal_api/models/route_api.dart';

class RouteParser{

	static bool _isEmptyRoute(List routeJson) => (routeJson == null);

	static RouteStopApi parseRouteStop(Map routeStop){
		return RouteStopApi(
			routeStop["pickupname"],
			routeStop["routeid"],
			routeStop["busstopcode"],
			routeStop["lat"],
			routeStop["long"]);

	}

	static RouteApi parse(String serviceName, Map data){


		RouteApi route = RouteApi(serviceName);

		List routeJson = data["PickupPointResult"]["pickuppoint"];

		if(_isEmptyRoute(routeJson)){
			print("[!!!] Error. Empty route. Service name (${serviceName}) does not exist.");
			return route;
		}else {
			routeJson.forEach((routeStopJson) => route.routeStops.add(parseRouteStop(routeStopJson)));
			print("[+] Route parsing success. length=${route.routeStops.length}");
			return route;
		}


	}
}