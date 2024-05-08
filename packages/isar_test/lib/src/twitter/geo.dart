import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@embedded
class Place {
  Place();

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  String? id;

  String? url;

  @Enumerated(EnumType.name)
  PlaceType? placeType;

  String? name;

  String? fullName;

  String? countryCode;

  String? country;
}

enum PlaceType {
  admin,
  country,
  city,
  poi,
  neighborhood;
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@embedded
class Coordinates {
  Coordinates();

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  List<double>? coordinates;

  String? type;
}
