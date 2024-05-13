import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class LocationDto {
  LocationDto({
    this.name,
    this.url,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  final String? name;
  final String? url;

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}
