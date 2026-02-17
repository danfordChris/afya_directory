import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

enum InputFieldVariant { standard, dropdown }

class InputField<T> extends StatefulWidget {
  const InputField({
    super.key,
    this.controller,
    this.isEnabled = true,
    this.obscureText,
    this.labelText,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.prefix,
    this.prefixText,
    this.suffixIcon,
    this.suffix,
    this.borderColor,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.onTap,
    this.isReadOnly = false,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.onChanged,
    this.onSubmitted,
    this.onCompleted,
    this.autofocus = false,
    this.focusNode,
    this.variant = InputFieldVariant.standard,
    this.borderRadius,
    this.dense,
    this.fillColor,
    this.inputFormatters,
    this.maxLength,
  }) : pinLength = null,
       pinBoxWidth = null,
       pinBoxHeight = null,
       initialValue = null,
       itemLabel = null,
       items = null;

  const InputField.dropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.labelText,
    this.isEnabled = true,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.validator,
    this.onTap,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.borderRadius,
    this.fillColor,
    this.initialValue,
    this.itemLabel,
  }) : controller = null,
       prefix = null,
       prefixText = null,
       suffix = null,
       keyboardType = null,
       textCapitalization = null,
       isReadOnly = false,
       onSubmitted = null,
       onCompleted = null,
       autofocus = false,
       focusNode = null,
       variant = InputFieldVariant.dropdown,
       pinLength = null,
       pinBoxWidth = null,
       pinBoxHeight = null,
       dense = null,
       maxLength = null,
       inputFormatters = null,
       obscureText = null;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final bool? obscureText;
  final bool isEnabled;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool isReadOnly;
  final Color? borderColor;
  final String? Function(String? value)? validator;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputFieldVariant? variant;
  final Function(T?)? onChanged;
  final Function(String)? onCompleted;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final bool autofocus;
  final FocusNode? focusNode;
  final int? pinLength;
  final double? pinBoxWidth;
  final double? pinBoxHeight;
  final BorderRadius? borderRadius;
  final bool? dense;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final List<T>? items;
  final T? initialValue;
  final String Function(T)? itemLabel;

  @override
  State<InputField<T>> createState() => _InputFieldState<T>();
}

class _InputFieldState<T> extends State<InputField<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[Text(widget.labelText!, style: context.bodyMedium), const SizedBox(height: 4)],
        _buildField(context, widget.variant!),
        if (widget.helperText != null) ...[const SizedBox(height: 4), Text(widget.helperText!, style: context.labelSmall.light)],
      ],
    );
  }

  Widget _buildField(BuildContext context, InputFieldVariant variant) {
    return switch (variant) {
      InputFieldVariant.dropdown => _buildDropdownField(context),
      _ => _buildInputField(context),
    };
  }

  Widget _buildInputField(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.isEnabled,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText ?? false,
        autofocus: widget.autofocus,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        readOnly: widget.isReadOnly,
        style: _textStyle,
        cursorColor: _cursorColor,
        decoration: _decoration,
        validator: widget.validator,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        onChanged: (value) {
          widget.onChanged?.call(value as T?);
        },
        onEditingComplete: () {
          if (widget.onCompleted != null) {
            widget.onCompleted!(widget.controller?.text ?? '');
          }
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(value);
          }
          FocusScope.of(context).unfocus();
        },
        onTap: widget.onTap,
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.isEnabled,
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        items: _items,
        onTap: widget.onTap,
        initialValue: widget.initialValue,
        decoration: _decoration,
        hint: Text(widget.hintText ?? 'Select', style: _hintStyle),
        onChanged: (value) => widget.onChanged?.call(value),
        validator: widget.validator == null ? null : (T? value) => widget.validator!(value?.toString()),
        // validator: widget.validator,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(16.0),
        icon: widget.suffixIcon ?? HugeIcon(icon: HugeIcons.strokeRoundedArrowDown01, color: context.colorScheme.primary),
      ),
    );
  }

  List<DropdownMenuItem<T>>? get _items {
    if (widget.items == null) return null;
    return widget.items!
        .map<DropdownMenuItem<T>>(
          (value) => DropdownMenuItem<T>(
            value: value,
            child: Text(widget.itemLabel != null ? widget.itemLabel!(value) : value.toString(), style: _textStyle),
          ),
        )
        .toList();
  }

  InputDecoration get _decoration {
    return InputDecoration(
      isDense: widget.dense,
      hintText: widget.hintText,
      hintStyle: _hintStyle,
      prefixIcon: widget.prefixIcon,
      prefix: widget.prefix,
      prefixText: widget.prefixText,
      prefixStyle: context.bodyMedium,
      suffixIcon: widget.suffixIcon,
      suffix: widget.suffix,
      filled: true,
      fillColor: _fillColor,
      border: widget.border ?? _border,
      focusedBorder: widget.focusedBorder ?? _border,
      enabledBorder: widget.enabledBorder ?? _enabledBorder,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }

  InputBorder get _enabledBorder {
    return OutlineInputBorder(
      borderSide: BorderSide(color: widget.borderColor ?? context.colorScheme.surface, width: 2.0),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12.0),
    );
  }

  InputBorder get _border {
    return OutlineInputBorder(
      borderSide: BorderSide(color: _focusedBorderColor, width: 2.0),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12.0),
    );
  }

  Color get _fillColor {
    if (widget.fillColor != null) return widget.fillColor!;
    return context.colorScheme.surfaceContainer;
  }

  Color get _focusedBorderColor {
    return context.colorScheme.primary;
  }

  TextStyle get _hintStyle {
    return context.bodyMedium.copyWith(color: context.colorScheme.outline);
  }

  TextStyle get _textStyle {
    return context.bodyMedium.copyWith(color: context.colorScheme.onSurface);
  }

  Color? get _cursorColor {
    return context.colorScheme.onSurface;
  }
}

//VALIDATION RULES
// RequiredRule - Validates that a value is not null or empty
// EmailRule - Validates that a string is a valid email address
// PasswordRule - Validates that a string meets password requirements
// PasswordMatchRule - Validates that a string matches another string
// LengthRule - Validates that a string's length is within specified bounds
// MinLengthRule - Validates that a string's length is at least a specified minimum
// MaxLengthRule - Validates that a string's length is at most a specified maximum
// ValueRule - Validates that a numeric value is within specified bounds
// MinValueRule - Validates that a numeric value is at least a specified minimum
// MaxValueRule - Validates that a numeric value is at most a specified maximum
// PhoneRule - Validates that a string is a valid phone number
// CountryPhoneRule - Validates that a string is a valid phone number for a specific country
// UrlRule - Validates that a string is a valid URL
// IPAddressRule - Validates that a string is a valid IPv4 or IPv6 address
// CreditCardRule - Validates that a string is a valid credit card number
// DateRule - Validates that a date string is within specified bounds
// DateRangeRule - Validates that an end date is after a start date (string inputs)
