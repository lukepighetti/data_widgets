import 'package:flutter/material.dart';

// TODO: make a swipeable version of this
class EnumStack<T extends Enum> extends StatefulWidget {
  const EnumStack({
    super.key,
    required this.value,
    required this.values,
    required this.builder,
    this.slideFraction = 1.0,
    this.onEnd,
    this.ignorePointerWhileAnimating = true,
  });

  final T value;
  final List<T> values;
  final Widget Function(BuildContext, T) builder;
  final double slideFraction;
  final VoidCallback? onEnd;
  final bool ignorePointerWhileAnimating;

  @override
  State<EnumStack<T>> createState() => _EnumStackState<T>();
}

class _EnumStackState<T extends Enum> extends State<EnumStack<T>> {
  final a = <T>{};

  @override
  void didUpdateWidget(covariant EnumStack<T> oldWidget) {
    if (oldWidget.value != widget.value) {
      setState(() {
        a.add(widget.value);
        a.add(oldWidget.value);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final valueIndex = widget.values.indexOf(widget.value);

    return IgnorePointer(
      ignoring: a.isNotEmpty && widget.ignorePointerWhileAnimating,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (final (i, x) in widget.values.indexed)
            Builder(
              builder: (context) {
                final d = (i - valueIndex).toDouble();
                var selected = x == widget.value;
                var animating = a.contains(x);
                var k = widget.slideFraction;

                return AnimatedSlide(
                  key: ValueKey(x),
                  offset: Offset((d).clamp(-k, 1).toDouble(), 0),
                  duration: Duration(milliseconds: 750),
                  curve: Curves.easeOut,
                  onEnd: () async {
                    if (mounted) setState(() => a.remove(x));
                    if (a.isEmpty) widget.onEnd?.call();
                  },
                  child: Visibility(
                    visible: animating || selected,
                    child: widget.builder(context, x),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
