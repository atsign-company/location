import './location.dart';
import 'package:at_client/at_client.dart';
import 'package:at_utils/at_logger.dart';
import '../services/atclient_services.dart';
import 'dart:convert';

// Step 1: Run @Sean secondary
// Step 2: Run @Colin, @Kevin secondaries too so that you can sharing of the data
// Step 3: Properly instantiate AtClientService and use it from the app
// (Learn proper instantiation from @vote, @HelloWorld apps)

class LocationService {
  AtClientService atClientService;

  Future<void> updateLocation(Location currentLocation) async{
    atClientService = AtClientService.getInstance();
    var atObject = AtObject()
      ..key = 'location'
      ..value = jsonEncode(currentLocation);
    // Save for yourself first,
    await atClientService.put(atObject);
  }

  Future<bool> shareLocation(Location currentLocation, String foratsign, Criteria criteria) async {
    if (!criteria.isValid()) {
      return false;
    }
    var atObject = AtObject()
      ..key = 'location'
      ..value = jsonEncode(currentLocation)
      ..sharedWith = foratsign;

    await atClientService.put(atObject);
    return true;
  }

  Future<Location> getCurrentLocation() async {
    var jsonLocation = await atClientService.atClient.get('location');
    jsonLocation = jsonLocation.replaceAll('data:', '').trim();
    print(jsonLocation);
    return jsonDecode(jsonLocation);
  }

}

abstract class Criteria {
  bool isValid() {
    return true;
  }
}

class TimeBasedCriteria implements Criteria {

  // TimeBasedCriteria(long milliseconds) {
  //
  // }

  @override
  bool isValid() {
    // TODO: implement isValid
    return true;
  }

}

class ProximityBasedCriteria implements Criteria {

  @override
  bool isValid() {
    // TODO: implement isValid
    return true;
  }

}