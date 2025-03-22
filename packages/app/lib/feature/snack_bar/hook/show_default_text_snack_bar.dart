import 'package:app/feature/app_logger/hook/use_app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef UseShowDefaultTextSnackBarReturn = ({
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function({
    required String text,
  }) run,
});

typedef UseShowDefaultTextSnackBar = UseShowDefaultTextSnackBarReturn
    Function();

const String _hookName = 'useShowDefaultTextSnackBar';

UseShowDefaultTextSnackBarReturn useShowDefaultTextSnackBarImpl() {
  final context = useContext();
  final appLogger = useAppLogger();

  final run = useCallback(({required String text}) {
    appLogger.i(['$_hookName#run']);

    final snackBar = SnackBar(
      content: Text(text),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });

  return (run: run,);
}

const UseShowDefaultTextSnackBar useShowDefaultTextSnackBar =
    useShowDefaultTextSnackBarImpl;
