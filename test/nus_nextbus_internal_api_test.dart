
import 'package:nus_nextbus_internal_api/nus_nextbus_internal_api.dart';
import 'package:test/test.dart';

void main() {

	NusNextbusInternalApi _api = NusNextbusInternalApi();
	group('BusStops', () {
		test(".getBusStops()", () {
			var string = "  foo ";
			expect(string.trim(), equals("foo"));
		});
	});

	group('Route', () {

	});

	group('Timings', () {

	});
}
