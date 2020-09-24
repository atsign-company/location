import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  double latitude;
  double longitude;


  Location(double lat, double long) {
    this.latitude = lat;
    this.longitude = long;
  }

  Map<String, double> toJson() =>
      {
        'lat': this.latitude,
        'long': this.longitude,
      };

  Location fromJson(Map<String, double> json) {
    var latitude = json['lat'];
    var longitude = json['long'];
    var newLocation = new Location(latitude, longitude);
    return newLocation;
  }

}