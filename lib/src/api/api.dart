import 'dart:convert';
import 'dart:io';

import 'package:nus_nextbus_internal_api/src/models/bus_stop_api.dart';
import 'package:nus_nextbus_internal_api/src/models/route_api.dart';
import 'package:nus_nextbus_internal_api/src/models/timing_api.dart';
import 'package:nus_nextbus_internal_api/src/parsers/bus_stops_parser.dart';
import 'package:nus_nextbus_internal_api/src/parsers/route_parser.dart';
import 'package:nus_nextbus_internal_api/src/parsers/timing_parser.dart';

class Api{
	final String METHOD_BUS_STOPS = "/BusStops";
	final String METHOD_SHUTTLE_SERVICE = "/Shuttleservice";
	final String METHOD_PICKUP_POINT = "/PickupPoint";

	final String PARAM_ROUTE_CODE = "route_code";
	final String PARAM_BUS_STOP_CODE = "busstopname";

	final String PROTO = "https://";
	final String HOST = "nextbus.comfortdelgro.com.sg";
	final String PATH = "/eventservice.svc";

	HttpClient httpClient = new HttpClient();

	String _formatUrl(String method,[String params=""]) {
		return "${PROTO}${HOST}${PATH}${method}${params == null ? "" : "?" + params}";
	}

	Future<Map> _get(String url)async {
		var request = await httpClient.getUrl(Uri.parse(url));
		request.headers.set("Accept", "applicatipn/json");

		var response = await request.close();

		if (response.statusCode == HttpStatus.ok) {
			Stream jsonStream = response.transform(utf8.decoder);
			return json.decode(await jsonStream.join(""));
		}else {
			throw("[error] http get request error");
		}

	}

	Future<List<BusStopApi>> getBusStops()async {
		Map m = await _get(_formatUrl(METHOD_BUS_STOPS));
		return BusStopsParser.parse(m);
	}

	Future<RouteApi> getRoute(String serviceName)async {
		Map m = await _get(_formatUrl(METHOD_PICKUP_POINT, "${PARAM_ROUTE_CODE}=${serviceName}"));
		return RouteParser.parse(serviceName, m);
	}

	Future<BusStopTimingsApi> getBusStopTimings(String busStopCode)async{
		Map m = await _get(_formatUrl(METHOD_SHUTTLE_SERVICE, "${PARAM_BUS_STOP_CODE}=${busStopCode}"));
		return TimingParser.parse(busStopCode, m);
	}
}