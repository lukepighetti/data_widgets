import 'package:flutter/material.dart';

class CollectionColumn<T> extends StatelessWidget {
  const CollectionColumn({
    super.key,
    required this.source,
    required this.builder,
    required this.onChange,
    this.actions = const [CollectionAction.move, CollectionAction.delete],
  });

  final List<T> source;

  final Widget Function(BuildContext, T) builder;

  final ValueChanged<List<T>> onChange;

  final List<CollectionAction> actions;

  @override
  Widget build(BuildContext context) {
    return CollectionFlex<T>(
      source: source,
      builder: builder,
      onChange: onChange,
      actions: actions,
      direction: Axis.vertical,
    );
  }
}

class CollectionRow<T> extends StatelessWidget {
  const CollectionRow({
    super.key,
    required this.source,
    required this.builder,
    required this.onChange,
    this.actions = const [CollectionAction.move, CollectionAction.delete],
  });

  final List<T> source;

  final Widget Function(BuildContext, T) builder;

  final ValueChanged<List<T>> onChange;

  final List<CollectionAction> actions;

  @override
  Widget build(BuildContext context) {
    return CollectionFlex<T>(
      source: source,
      builder: builder,
      onChange: onChange,
      actions: actions,
      direction: Axis.horizontal,
    );
  }
}

// TODO: CollectionListView with onVisibleChanged(List<Key>)

class CollectionFlex<T> extends StatefulWidget {
  const CollectionFlex({
    super.key,
    required this.source,
    required this.builder,
    required this.onChange,
    required this.direction,
    this.keyBuilder,
    this.actions = const [CollectionAction.move, CollectionAction.delete],
  });

  final List<T> source;

  final Widget Function(BuildContext, T) builder;

  final ValueChanged<List<T>> onChange;

  final List<CollectionAction> actions;

  final Axis direction;

  final Key Function(T)? keyBuilder;

  @override
  State<CollectionFlex> createState() => _CollectionFlexState<T>();
}

class _CollectionFlexState<T> extends State<CollectionFlex<T>> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement delete with horizontal swipe action
    // TODO: implement add, move, delete animations for when the source changes without human interaction
    // TODO: make proxyDecorator no-op and add `bool dragging` to builder
    return ReorderableListView(
      shrinkWrap: true,
      scrollDirection: widget.direction,
      physics: NeverScrollableScrollPhysics(),
      onReorder: (oldIndex, newIndex) {
        widget.onChange(_reorder(widget.source, newIndex, oldIndex));
      },

      children: [
        for (final x in widget.source)
          Builder(
            key: widget.keyBuilder?.call(x) ?? ValueKey(x),
            builder: (context) {
              return widget.builder(context, x);
            },
          ),
      ],
    );
  }
}

enum CollectionAction {
  move,
  @Deprecated("not yet supported")
  delete,
}

List<T> _reorder<T>(List<T> source, int newIndex, int oldIndex) {
  if (newIndex > oldIndex) {
    newIndex -= 1;
  }
  final items = List<T>.from(source);
  final item = items.removeAt(oldIndex);
  items.insert(newIndex, item);
  return items;
}
