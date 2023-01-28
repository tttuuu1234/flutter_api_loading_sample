import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueLayout<T> extends StatelessWidget {
  const AsyncValueLayout({
    Key? key,
    required this.title,
    required this.asyncValue,
    required this.data,
  }) : super(key: key);

  final String title;
  final AsyncValue<T> asyncValue;
  final Widget? Function(T data) data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: asyncValue.when(
        data: data,
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
