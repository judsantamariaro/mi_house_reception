import 'package:flutter/material.dart';
import 'package:mi_house_reception/core/util/app_state.dart';

class CustomModals {
  Future<void> showError({
    required String message,
    String title = 'Oops ha ocurrido un error',
    VoidCallback? onPressed,
    VoidCallback? confirmButtonAction,
  }) {
    return showDialog(
      context: appContext.getContext,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: () => onPressed == null ? Navigator.of(context).pop() : onPressed(),
            child: const Text('Salir'),
          ),
          if (confirmButtonAction != null)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                confirmButtonAction();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((_) => Colors.red),
              ),
              child: const Text('Confirmar'),
            ),
        ],
      ),
    );
  }

  Future<void> showWellDone({
    required String message,
    String title = '¡Felicitaciones!',
    VoidCallback? onPressed,
    VoidCallback? confirmButtonAction,
  }) {
    return showDialog(
      context: appContext.getContext,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
          if (confirmButtonAction != null)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                confirmButtonAction();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((_) => Colors.red),
              ),
              child: const Text('Confirmar'),
            ),
        ],
      ),
    );
  }
}
