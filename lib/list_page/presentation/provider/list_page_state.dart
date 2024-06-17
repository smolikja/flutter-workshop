import 'package:equatable/equatable.dart';
import 'package:flutter_workshop/list_page/domain/entity/character.dart';

enum ListPageStatus { loading, content, error }

class ListPageState extends Equatable {
  const ListPageState({
    this.status = ListPageStatus.loading,
    this.characters = const [],
    this.hasReachedEnd = false,
    this.currentPage = 0,
  });

  final ListPageStatus status;
  final List<CharacterEntity> characters;
  final bool hasReachedEnd;
  final int currentPage;

  ListPageState copyWith({
    ListPageStatus? status,
    List<CharacterEntity>? characters,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return ListPageState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [status, characters, hasReachedEnd, currentPage];
}
