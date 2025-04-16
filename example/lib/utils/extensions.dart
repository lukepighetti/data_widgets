extension ListExtensions<T> on List<T> {
  List<T> replacedWhere(bool Function(T) test, T replacement) {
    return [
      for (final e in this)
        if (test(e)) replacement else e,
    ];
  }
}
