import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitutde;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitutde = position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}