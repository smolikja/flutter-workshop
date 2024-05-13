import 'package:flutter_workshop/list_page/data/dto/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class CharacterDto {
  CharacterDto({
    required this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    required this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);

  final int id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final LocationDto? origin;
  final LocationDto? location;
  final String image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  Map<String, dynamic> toJson() => _$CharacterDtoToJson(this);
}
