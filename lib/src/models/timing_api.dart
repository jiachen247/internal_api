class TimingApi{
	final String serviceName;
	final String arrivalTime;
	final String nextArrivalTime;

	TimingApi(this.serviceName, this.arrivalTime, this.nextArrivalTime);

	@override
	String toString()=> "!!! TimingApi Object. ${serviceName} ${arrivalTime} ${nextArrivalTime}";
}

class BusStopTimingsApi {
	final String busStopCode; // is empty string init rlly necessary?
	final List<TimingApi> timings = [];

	BusStopTimingsApi(this.busStopCode);

	@override
	String toString() => "!!! BusStopTimingsApi Object. busstopcode=${busStopCode} | length=${timings.length}";
}