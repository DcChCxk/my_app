

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BaseProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onReady;

  BaseProviderWidget({
    this.model,
    this.child,
    this.onReady,
    this.builder
});

  @override
  _BaseProviderWidgetState<T> createState() => _BaseProviderWidgetState<T>();

}

class _BaseProviderWidgetState<T extends ChangeNotifier> extends State<BaseProviderWidget<T>> {

  @override
  void initState() {
    super.initState();
    if(widget.onReady != null) {
      widget.onReady(widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }

}