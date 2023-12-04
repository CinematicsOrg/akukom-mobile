import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components.dart';

class Toast {
  Toast._();

  static final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? show(
    String message,
  ) =>
      key.currentState
          ?.showSnackBar(_getSnackBar(message, SnackbarType.normal));

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
      showByContext({
    required BuildContext context,
    required String message,
    SnackbarType type = SnackbarType.info,
    Color? color,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      _getSnackBar(message, type, color: color),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showInfo(
    String message, {
    Color? color,
  }) {
    return key.currentState?.showSnackBar(
      _getSnackBar(message, SnackbarType.info, color: color),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showError(
    String message,
  ) =>
      key.currentState?.showSnackBar(_getSnackBar(message, SnackbarType.error));

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSuccess(
    String message,
  ) =>
      key.currentState
          ?.showSnackBar(_getSnackBar(message, SnackbarType.success));

  static SnackBar _getSnackBar(
    String message,
    SnackbarType type, {
    Color? color,
  }) {
    return SnackBar(
      shape: const RoundedRectangleBorder(),
      content: SizedBox(
        width: 1.0.w,
        child: Row(
          children: [
            if (getIcon(type) != null) ...[
              getIcon(type)!,
              const HSpace(8.0),
            ],
            Expanded(
              child: Text(
                message,
                // color: AppColors.white,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: color ?? getBackgroundColor(type),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14.0),
      margin: EdgeInsets.zero,
    );
  }

  static Color getBackgroundColor(SnackbarType type) {
    switch (type) {
      case SnackbarType.error:
        return kcErrorColor;
      case SnackbarType.success:
        return kcSuccessColor;
      case SnackbarType.info:
        return kcBlack;
      default:
        return kcBlack;
    }
  }

  static Widget? getIcon(SnackbarType type) {
    switch (type) {
      case SnackbarType.error:
        return GestureDetector(
          onTap: () => key.currentState?.hideCurrentSnackBar(),
          child: const Svg.scaleDown(
            path: AppIcons.logo,
            color: kcWhite,
          ),
        );
      case SnackbarType.success:
        return const Icon(Icons.done, color: kcWhite);
      // case SnackbarType.info:
      //   return const Svg.scaleDown(
      //     path: AppIcons.info,
      //     color: AppColors.white,
      //   );
      default:
        return null;
    }
  }

  static void hide() => key.currentState?.hideCurrentSnackBar();
}
