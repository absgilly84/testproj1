// value_builder.dart
import 'package:flutter/material.dart';

class ValueBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(BuildContext context, T snapshot) builder;

  const ValueBuilder({super.key, required this.stream, required this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        return builder(context, snapshot.data as T);
      },
    );
  }
}
