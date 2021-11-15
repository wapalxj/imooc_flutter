import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model; //维护的数据
  final Widget? child;

  final Function(T)? onModelInit; // 请求网络数据

  final Widget Function(BuildContext context, T model, Widget? child) builder;

  const ProviderWidget(
      {Key? key,
      required this.model,
      this.child,
      this.onModelInit,
      required this.builder})
      : super(key: key);

  @override
  _ProviderWidgetState createState() => _ProviderWidgetState();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget> {
  T? model;

  @override
  void initState() {
    super.initState();
    model = widget.model as T?;
    if (widget.onModelInit != null && model != null) {
      widget.onModelInit!(model!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer(builder: widget.builder),
    );
  }
}
