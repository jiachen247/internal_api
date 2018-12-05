class BusStopApi {
	final String caption;
	final double latitude;
	final double longitude;
	final String name;

	BusStopApi(this.caption, this.latitude, this.longitude, this.name);

	@override
	String toString() => "!!! BusStop Object; ${name} ${caption} ${latitude} ${longitude}";
}