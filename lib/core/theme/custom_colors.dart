import 'package:flutter/material.dart';

class CustomColors {
  final ColorScheme colorScheme;
  final Brightness brightness;

  CustomColors._(this.colorScheme, this.brightness);

  factory CustomColors.of(BuildContext context) {
    final theme = Theme.of(context);
    return CustomColors._(theme.colorScheme, theme.brightness);
  }

  const CustomColors(this.colorScheme, this.brightness);

  Color get _onErrorContainer => const Color(0xFFFB3B52);
  Color get _onInfoContainer => const Color(0xFF166CED);
  Color get _onSuccessContainer => const Color(0xFF009959);

  Color get surface => brightness == Brightness.dark ? Colors.black : Colors.white;

  Color get successContainer => _onSuccessContainer.withValues(alpha: 0.2);
  Color get onSuccessContainer => _onSuccessContainer;

  Color get warningContainer => const Color(0xFFFFEDD1);
  Color get onWarningContainer => const Color(0xFFFF9F0A);

  Color get redContainer => const Color(0xFF7A1111);
  Color get onRedContainer => colorScheme.onError;

  Color get destructiveContainer => brightness == Brightness.dark ? const Color(0xFFEE8884) : const Color(0xFFFFDAD6);
  Color get onDestructiveContainer => colorScheme.error;

  Color get errorContainer => _onErrorContainer.withValues(alpha: 0.2);
  Color get onErrorContainer => _onErrorContainer;

  Color get infoContainer => _onInfoContainer.withValues(alpha: 0.2);
  Color get onInfoContainer => _onInfoContainer;

  Gradient primaryBorderGradient() {
    return LinearGradient(colors: [colorScheme.tertiary, colorScheme.primaryContainer], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  }

  Gradient secondaryBorderGradient() {
    return LinearGradient(colors: [colorScheme.tertiary, colorScheme.primary], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  }
}

extension CustomColorsExtension on BuildContext {
  CustomColors get customColors => CustomColors.of(this);
}
