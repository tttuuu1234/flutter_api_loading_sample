import 'package:flutter/material.dart';
import 'package:flutter_api_loading_sample/async_value_layout.dart';
import 'package:flutter_api_loading_sample/pages/home/notifeir.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchList = ref.watch(fetchListProvider);
    return AsyncValueLayout<List<String>>(
      title: 'Home',
      asyncValue: fetchList,
      data: (data) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final title = data[index];
            return Card(
              child: ListTile(
                title: Text(title),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: data.length,
        );
      },
    );
  }
}
