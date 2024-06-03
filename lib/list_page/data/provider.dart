import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/list_page/data/source/api.dart';

final apiProvider = Provider<Api>((ref) => ApiImpl());
