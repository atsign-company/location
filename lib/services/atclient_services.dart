import 'dart:core';
//import 'package:at_client_mobile/at_client_auth.dart';
//import 'package:at_settings/services/at_me_utils.dart';
import 'package:at_utils/at_logger.dart';
import 'package:at_client/at_client.dart';
//import 'state_management.dart';
import 'package:at_commons/at_commons.dart' as at_commons;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:at_client/at_client.dart';
import 'package:at_client_mobile/at_client_mobile.dart';


class AtLocationAuthService {
  static final AtLocationAuthService _singleton = AtLocationAuthService._internal();

  AtLocationAuthService._internal();

  final AtSignLogger _logger = AtSignLogger('AtLocationAuthService');

  factory AtLocationAuthService.getInstance() {
    return _singleton;
  }

  //StateContainerState container;
  AtClientService atClientServiceInstance;
  AtClientImpl atClientInstance;

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

  Future<String> get(at_commons.AtKey atKey) async {
    var result = await this.atClientInstance.getAll(atKey);
    return result;
  }

  Future<bool> put(AtObject atObject, {bool isNameSpaceRequired}) async {
    Metadata metadata = Metadata()
      ..isPublic = atObject.isPublic
      ..namespaceAware = isNameSpaceRequired ??= true;
    return await this.atClientInstance.put(atObject.key, atObject.value,
        sharedWith: atObject.sharedWith, metadata: metadata);
  }

  Future<bool> delete(AtObject atObject) async {
    return await this.atClientInstance.delete(atObject.key,
        isPublic: atObject.isPublic, sharedWith: atObject.sharedWith);
  }

  Future<List<String>> getKeys(String sharedBy) async {
    return await this
        .atClientInstance
        .getKeys(sharedBy: sharedBy);
  }

}
