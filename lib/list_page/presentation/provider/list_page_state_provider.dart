import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/list_page/domain/provider.dart';
import 'package:flutter_workshop/list_page/domain/usecase/get_all_characters.dart';
import 'package:flutter_workshop/list_page/presentation/provider/list_page_state.dart';

final listPageStateProvider =
    StateNotifierProvider<ListPageStateNotifier, ListPageState>(
  (ref) => ListPageStateNotifier(
    getAllCharactersUC: ref.read(getAllCharctersProvider),
  ),
);

class ListPageStateNotifier extends StateNotifier<ListPageState> {
  ListPageStateNotifier({
    required GetAllCharactersUC getAllCharactersUC,
  })  : _getAllCharacters = getAllCharactersUC,
        super(const ListPageState()) {
    fetchNextPage();
  }

  final GetAllCharactersUC _getAllCharacters;

  Future<void> fetchNextPage() async {
    if (state.hasReachedEnd) return;

    state = state.copyWith(status: ListPageStatus.loading);

    final list = await _getAllCharacters(page: state.currentPage + 1);

    if (list?.characters != null && list!.characters!.isNotEmpty) {
      state = state.copyWith(
        status: ListPageStatus.content,
        currentPage: state.currentPage + 1,
        characters: List.of(state.characters)..addAll(list.characters!),
        hasReachedEnd: false,
      );
    } else {
      state = state.copyWith(
        currentPage: state.currentPage + 1,
        status: ListPageStatus.error,
      );
    }
  }
}
