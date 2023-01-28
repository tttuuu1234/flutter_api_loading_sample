import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchListProvider = FutureProvider<List<String>>((ref) async {
  return Future.microtask(() async {
    await Future.delayed(const Duration(seconds: 5));
    return Future.value(List.generate(20, (index) => '$index番目'));
  });
});
