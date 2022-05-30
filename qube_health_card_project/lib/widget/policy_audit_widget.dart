import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qube_health_card_project/constant/app_colors.dart';
import 'package:qube_health_card_project/constant/app_image_path.dart';

class FieldAndLabel extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final onChanged;
  final String prefixImagePath;
  final suffixWidget;
  final key;
  final validator;
  final obscureText;
  final keyboardType;
  final textInputAction;
  final fillColor;
  final hintTextDecoration;
  final prefixWidget;
  final suffixIcon;
  final padding;
  final hintStyle;
  final maxLines;
  final border;
  final readOnly;
  List<TextInputFormatter>? inputFormatters;
  final outerPadding;
  double borderRadius = 8;
  final bool enableInteractiveSelection;
  final TextStyle? textStyle;

  final boxConstraints;
  final prefixBoxConstraints;
  final borderColor;

  FieldAndLabel({
    this.hintText,
    this.errorText,
    this.readOnly,
    this.maxLines = 1,
    this.textEditingController,
    this.prefixIcon,
    this.onChanged,
    this.suffixWidget,
    this.key,
    this.validator,
    this.hintStyle,
    this.textInputAction,
    this.obscureText = false,
    this.keyboardType,
    this.fillColor,
    this.border,
    this.suffixIcon,
    this.borderRadius = 8,
    this.prefixImagePath = AppImagePath.arrow,
    this.hintTextDecoration,
    this.prefixWidget,
    this.padding,
    this.outerPadding,
    this.inputFormatters,
    this.textStyle,
    this.borderColor,
    this.enableInteractiveSelection = false,
    this.boxConstraints,
    this.prefixBoxConstraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding ?? const EdgeInsets.all(0.0),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onChanged: onChanged,
        validator: validator,
        maxLines: maxLines ?? 1,
        inputFormatters: inputFormatters,
        style: textStyle ?? const TextStyle(color: AppColors.greyColor),
        keyboardType: keyboardType,
        textInputAction: textInputAction ?? TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            suffixIconConstraints: boxConstraints,
            contentPadding: padding ?? EdgeInsets.only(top: 10, bottom: 0),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      BorderSide(color: borderColor ?? AppColors.greyColor),
                ),
            focusedErrorBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      BorderSide(color: borderColor ?? AppColors.greyColor),
                ),
            focusedBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      BorderSide(color: borderColor ?? AppColors.greyColor),
                ),
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
            errorBorder: border ??
                OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius)),
                    borderSide: BorderSide(color: borderColor ?? Colors.red)),
            hintText: hintText,
            suffix: suffixWidget,
            prefix: prefixWidget,
            suffixIcon: suffixIcon,
            hintStyle: hintStyle ??
                const TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                ).copyWith(decoration: hintTextDecoration),
            filled: true,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixBoxConstraints,
            //  prefixIconConstraints: const BoxConstraints(minHeight: 0,minWidth: 0),
            fillColor: fillColor ?? AppColors.greyColor),
        controller: textEditingController,
        obscureText: obscureText,
      ),
    );
  }
}
