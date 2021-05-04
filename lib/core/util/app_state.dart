import 'package:flutter/material.dart';

class _GlobalContext {
  final context = GlobalKey<NavigatorState>();

  BuildContext get getContext => context.currentContext!;
}

final appContext = _GlobalContext();
