import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/core/widgets/platform_activity_indicator.dart';
import 'package:flutter_workshop/list_page/presentation/provider/list_page_state.dart';
import 'package:flutter_workshop/list_page/presentation/provider/list_page_state_provider.dart';
import 'package:flutter_workshop/list_page/presentation/widgets/character_list_item.dart';
import 'package:flutter_workshop/list_page/presentation/widgets/character_list_item_header.dart';

class ListPageContent extends ConsumerStatefulWidget {
  const ListPageContent({super.key});

  @override
  ConsumerState<ListPageContent> createState() => _ListPageContentState();
}

class _ListPageContentState extends ConsumerState<ListPageContent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(listPageStateProvider);
          final characters = state.characters;
          final hasEnded = state.hasReachedEnd;

          return ListView.builder(
            key: const ValueKey('list_page_list_key'),
            controller: _scrollController,
            itemCount: hasEnded ? characters.length : characters.length + 1,
            itemBuilder: (context, index) {
              if (index >= characters.length) {
                return !hasEnded
                    ? const PlatformActivityIndicator()
                    : const SizedBox();
              }

              final item = characters[index];
              return index == 0
                  ? Column(
                      children: [
                        const CharacterListItemHeader(
                          titleText: 'All Characters',
                        ),
                        CharacterListItem(item: item),
                      ],
                    )
                  : CharacterListItem(item: item);
            },
          );
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      ref.read(listPageStateProvider.notifier).fetchNextPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
