import '../models/location.dart';
import 'package:at_client/at_client.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:convert';
import 'package:at_client_mobile/at_client_mobile.dart';

// Step 1: Run @Sean secondary
// Step 2: Run @Colin, @Kevin secondaries too so that you can sharing of the data
// Step 3: Properly instantiate AtClientService and use it from the app
// (Learn proper instantiation from @vote, @HelloWorld apps)

class LocationService {
  AtClientService atClientServiceInstance;
  AtClientImpl atClientInstance;
  static final LocationService _singleton =
  LocationService._internal();

  factory LocationService.getInstance() {
    return _singleton;
  }

  LocationService._internal();

  Future<void> updateLocation(Location currentLocation) async{
    // Save for yourself first,
    await atClientInstance.put('location', jsonEncode(currentLocation));
  }

  Future<bool> shareLocation(Location currentLocation, String foratsign, Criteria criteria) async {
    if (!criteria.isValid()) {
      return false;
    }
    await atClientInstance.put('location', jsonEncode(currentLocation), sharedWith: foratsign);
    return true;
  }

  Future<Location> getCurrentLocation() async {
    var jsonLocation = await atClientInstance.get('location');
    jsonLocation = jsonLocation.replaceAll('data:', '').trim();
    print(jsonLocation);
    return jsonDecode(jsonLocation);
  }

  Future<bool> onboard({String atsign}) async{
    atClientServiceInstance = AtClientService();
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    String path = appDocumentDirectory.path;
    var atClientPreference = AtClientPreference() ..isLocalStoreRequired = true
      ..commitLogPath = path
      ..syncStrategy = SyncStrategy.IMMEDIATE
      ..rootDomain = 'test.do-sf2.atsign.zone'
      ..hiveStoragePath = path;
    var result =await atClientServiceInstance.onboard(atClientPreference: atClientPreference, atsign: atsign, namespace: 'location');
    atClientInstance = atClientServiceInstance.atClient;
    return result;
  }

  ///Returns `false` if fails in authenticating [atsign] with [cramSecret]/[privateKey].
  Future<bool> authenticate(String atsign, {String cramSecret, String privateKey}) async{
    var result =  await atClientServiceInstance.authenticate(atsign, cramSecret: cramSecret, privateKey: privateKey);
    atClientInstance = atClientServiceInstance.atClient;
    return result;
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