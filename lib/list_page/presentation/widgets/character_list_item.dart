import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/list_page/domain/entity/character.dart';

typedef OnCharacterListItemTap = void Function(CharacterEntity character);

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({
    super.key,
    required this.item,
  });

  final CharacterEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: SizedBox(
        height: 124,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ItemPhoto(item: item),
            _ItemDescription(item: item),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({required this.item});

  final CharacterEntity item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: colorScheme.surfaceVariant,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  item.name ?? '',
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Status: ${item.isAlive ? 'ALIVE' : 'DEAD'}',
                  style: textTheme.labelSmall!.copyWith(
                    color: item.isAlive ? Colors.lightGreen : Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Last location: ${item.location?.name ?? ''}',
                  style: textTheme.labelSmall!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemPhoto extends StatelessWidget {
  const _ItemPhoto({required this.item});

  final CharacterEntity item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: SizedBox(
        height: 122,
        child: Hero(
          tag: item.id,
          child: CachedNetworkImage(
            imageUrl: item.image,
            fit: BoxFit.cover,
            errorWidget: (ctx, url, err) => const Icon(Icons.error),
            placeholder: (ctx, url) => const Icon(Icons.image),
          ),
        ),
      ),
    );
  }
}
