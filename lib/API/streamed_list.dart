import 'dart:async';

class StreamedList<T> {
  final _controller = StreamController<List<T>>();
  final List<T> _list = [];

  StreamedList() {
    _controller.add(_list);
  }

  void add(T item) {
    _list.add(item);
    _controller.add(_list);
  }

  void addAll(List<T> items) {
    _list.addAll(items);
    _controller.add(_list);
  }

  Stream<List<T>> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
