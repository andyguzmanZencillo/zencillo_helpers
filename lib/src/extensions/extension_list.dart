extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension ExtensionList<T> on List<T> {
  E getWhere<E>(
    bool Function(T element) condition, {
    required E Function(T e) whenTrue,
    required E Function() whenFalse,
  }) {
    for (final element in this) {
      if (condition(element)) {
        return whenTrue(element);
      }
    }
    return whenFalse();
  }

  T? firstWhereNull(bool Function(T element) test) {
    return firstWhereOrNull(test);
  }
}
