import 'package:flutter/material.dart';

/// A reusable primary app button with loading + disabled states
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool expand;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double? elevation;
  final double gap;
  final BorderRadius borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? textStyle;
  final double? progressSize;

  /// Base constructor
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.expand = true,
    this.backgroundColor,
    this.foregroundColor,
    this.height = 52,
    this.elevation,
    this.gap = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.leading,
    this.trailing,
    this.textStyle,
    this.progressSize,
  });

  /// Primary button
  const AppButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.expand = true,
    this.height = 52,
    this.elevation,
    this.gap = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.leading,
    this.trailing,
    this.textStyle,
    this.progressSize,
  }) : backgroundColor = null,
       foregroundColor = null;

  /// Outline button
  const AppButton.outline({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.expand = true,
    this.height = 52,
    this.elevation,
    this.gap = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.leading,
    this.trailing,
    this.textStyle,
    this.progressSize,
  }) : backgroundColor = Colors.transparent,
       foregroundColor = null;

  /// Text button
  const AppButton.text({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.expand = true,
    this.height = 52,
    this.elevation,
    this.gap = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.leading,
    this.trailing,
    this.textStyle,
    this.progressSize,
  }) : backgroundColor = Colors.transparent,
       foregroundColor = null;

  /// Success button
  const AppButton.success({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.expand = true,
    this.height = 52,
    this.elevation,
    this.gap = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.leading,
    this.trailing,
    this.textStyle,
    this.progressSize,
  }) : backgroundColor = Colors.green,
       foregroundColor = Colors.white;

  /// Destructive button
  const AppButton.destructive({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.expand = true,
    this.height = 52,
    this.elevation,
    this.gap = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(14)),
    this.leading,
    this.trailing,
    this.textStyle,
    this.progressSize,
  }) : backgroundColor = Colors.red,
       foregroundColor = Colors.white;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine colors based on type and state
    final Color bgColor;
    final Color fgColor;

    if (backgroundColor == Colors.transparent) {
      // Outline or text button
      bgColor = Colors.transparent;
      fgColor = foregroundColor ?? colorScheme.primary;
    } else {
      // Solid buttons
      bgColor = backgroundColor ?? colorScheme.primary;
      fgColor = foregroundColor ?? colorScheme.onPrimary;
    }

    // Apply disabled opacity
    final effectiveBgColor = _isDisabled ? bgColor.withOpacity(0.5) : bgColor;
    final effectiveFgColor = _isDisabled ? fgColor.withOpacity(0.5) : fgColor;

    // Build button content
    final buttonContent = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: height,
      decoration: BoxDecoration(
        color: effectiveBgColor,
        borderRadius: borderRadius,
        boxShadow: elevation != null && !_isDisabled && backgroundColor != Colors.transparent
            ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: elevation! * 2, offset: Offset(0, elevation!))]
            : null,
      ),
      alignment: Alignment.center,
      child: isLoading
          ? SizedBox(
              width: progressSize ?? 22,
              height: progressSize ?? 22,
              child: CircularProgressIndicator(strokeWidth: 2.4, valueColor: AlwaysStoppedAnimation<Color>(effectiveFgColor)),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leading != null) ...[leading!, SizedBox(width: gap)],
                Flexible(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle ?? theme.textTheme.titleMedium?.copyWith(color: effectiveFgColor, fontWeight: FontWeight.w600),
                  ),
                ),
                if (trailing != null) ...[SizedBox(width: gap), trailing!],
              ],
            ),
    );

    // Add border for outline buttons
    final buttonWithBorder = backgroundColor == Colors.transparent && foregroundColor == null && !_isDisabled
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.primary.withOpacity(0.5)),
              borderRadius: borderRadius,
            ),
            child: buttonContent,
          )
        : buttonContent;

    return Semantics(
      button: true,
      enabled: !_isDisabled,
      label: text,
      child: SizedBox(
        width: expand ? double.infinity : null,
        child: ConstrainedBox(
          constraints: expand ? const BoxConstraints() : const BoxConstraints(minWidth: 80),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _isDisabled ? null : onPressed,
              borderRadius: borderRadius,
              splashColor: effectiveFgColor.withOpacity(0.1),
              highlightColor: effectiveFgColor.withOpacity(0.05),
              child: buttonWithBorder,
            ),
          ),
        ),
      ),
    );
  }
}
