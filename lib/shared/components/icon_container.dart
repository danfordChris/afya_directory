import 'package:afya_bee/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class IconContainer extends StatelessWidget {
  final String? iconWidget;
  final Color? iconColor;
  final Widget? icon;
  final double? iconSize;
  final double? containerSize;
  final Color? backgroundColor;
  final Function()? onTap;
  final double borderRadius;
  final Color? borderColor;

  const IconContainer({
    super.key,
    this.iconWidget,
    this.iconColor,
    this.icon,
    this.iconSize,
    this.borderRadius = 32,
    this.containerSize = 32,
    this.borderColor,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 1, color: borderColor ?? context.colorScheme.outline),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Builder(
          builder: (_) {
            if (iconWidget != null) {
              return Padding(
                padding: EdgeInsets.all((containerSize ?? 32) * 0.15),
                child: SvgPicture.asset(
                  iconWidget!,
                  colorFilter: ColorFilter.mode(iconColor ?? context.colorScheme.error, BlendMode.srcIn),
                  width: iconSize ?? 20,
                  height: iconSize ?? 20,
                ),
              );
            }
            return icon ?? HugeIcon(icon: HugeIcons.strokeRoundedHugeicons, color: iconColor ?? context.colorScheme.error, size: iconSize ?? 20);
          },
        ),
      ),
    );
  }
}
