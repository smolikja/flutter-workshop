import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_workshop/list_page/data/dto/character_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class Api {
  Future<CharacterListDto?> loadCharacters({int page = 0});
}

class ApiImpl implements Api {
  final dio = Dio();

  @override
  Future<CharacterListDto?> loadCharacters({int page = 0}) async {
    try {
      final response = await dio
          .get('https://rickandmortyapi.com/api/character/?page=$page');
      final data = CharacterListDto.fromJson(response.data!);
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response?.data);
          print(e.response?.headers);
          print(e.response?.requestOptions);
        }

        if (e.response?.statusCode == 404) return null;
      } else {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
