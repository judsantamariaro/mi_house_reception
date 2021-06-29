import 'package:json_annotation/json_annotation.dart';
part 'space_reservation_model.g.dart';

@JsonSerializable()
class SpaceReservationModel {
  final String nombreConjunto;

  SpaceReservationModel({required this.nombreConjunto});

  factory SpaceReservationModel.fromJson(Map<String, dynamic> json) => _$SpaceReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceReservationModelToJson(this);
}
