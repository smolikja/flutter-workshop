// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterListDto _$CharacterListDtoFromJson(Map<String, dynamic> json) =>
    CharacterListDto(
      characters: (json['results'] as List<dynamic>?)
          ?.map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterListDtoToJson(CharacterListDto instance) =>
    <String, dynamic>{
      'results': instance.characters,
    };
