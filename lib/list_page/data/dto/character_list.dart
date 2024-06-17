import 'package:flutter_workshop/list_page/data/dto/character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_list.g.dart';

@JsonSerializable()
class CharacterListDto {
  CharacterListDto({this.characters});

  factory CharacterListDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterListDtoFromJson(json);

  @JsonKey(name: 'results')
  final List<CharacterDto>? characters;

  Map<String, dynamic> toJson() => _$CharacterListDtoToJson(this);
}
