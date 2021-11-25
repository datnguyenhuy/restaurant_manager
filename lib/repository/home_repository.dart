import 'dart:collection';

import 'package:base_flutter_framework/services/service.dart';
import 'package:base_flutter_framework/services/socket_io.dart';
import 'package:base_flutter_framework/utils/shared.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//import 'package:geocoding/geocoding.dart';
class HomeRepository {
  Future<void> getInvitations() async {
    Map<String, dynamic> param = HashMap();
    param.putIfAbsent("player_id", () => Shared.getInstance().userModel!.id);

    Response? response = await ServiceCommon.getInstance()!.postHttp(
        api: ServiceCommon.getInstance()!.modeGetInvitations,
        host: ServiceCommon.getInstance()!.severUrl,
        param: param);

    // SocketMain.getInstance()
    //     .socket!
    //     .on("playerReceiveInvitation", (data) => print(""));

    String address = await getAddressFromLatLong(
        longitude: 105.83415979, latitude: 21.0277644);

    print(address);

    print(response!.data);
  }

  Future<String> getAddressFromLatLong(
      {required double longitude, required double latitude}) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    String address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    return address;
  }
}

// _getLocation() async
//       {
//         List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
//         // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//         // debugPrint('location: ${position.latitude}');
//         // final coordinates = new Coordinates(position.latitude, position.longitude);
//         // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//         // var first = addresses.first;
//         // print("${first.featureName} : ${first.addressLine}");
//       }
// }
