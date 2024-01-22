// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cores/constants/color.dart';
import '../../cores/utils/sizer_utils.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.textEditingController,
    this.autoCorrect = true,
    required this.hintText,
    this.title,
    this.validator,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.maxLine = 1,
    this.suffix,
    this.suffixWidget,
    this.prefix,
    this.onChanged,
    this.onSubmitted,
    this.boldHintText = false,
    this.inputFormatters,
    this.prefixText,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final bool autoCorrect;
  final String hintText;
  final String? title;
  final bool? readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType textInputType;
  final bool isPassword;
  final bool enabled;
  final bool boldHintText;
  final int? maxLine;
  final IconData? suffix;
  final Widget? suffixWidget;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return ValueListenableBuilder<bool>(
      valueListenable: obscureText,
      builder: (BuildContext context, bool value, dynamic child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Text(
                widget.title!,
                style: GoogleFonts.inter(
                    color: isDarkMode ? kcWhite : kcBlack, fontSize: sp(13)),
              ),
            const VSpace(5),
            TextFormField(
              inputFormatters: widget.inputFormatters,
              maxLines: widget.maxLine,
              enabled: widget.enabled,
              readOnly: widget.readOnly ?? false,
              onTap: widget.onTap,
              style: GoogleFonts.inter(
                color: Theme.of(context).textTheme.titleMedium!.color,
                fontWeight: FontWeight.w600,
                fontSize: sp(13),
              ),
              controller: widget.textEditingController,
              autocorrect: widget.autoCorrect,
              autovalidateMode: widget.validator != null
                  ? AutovalidateMode.onUserInteraction
                  : null,
              decoration: InputDecoration(
                prefixText: widget.prefixText,
                prefixStyle: GoogleFonts.inter(
                  color: Theme.of(context).textTheme.titleMedium!.color,
                  fontWeight: FontWeight.w600,
                  fontSize: sp(13),
                ),
                errorMaxLines: 2,
                filled: true,
                fillColor: isDarkMode
                    ? const Color(0xff272727).withOpacity(0.1)
                    : kcWhite,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode
                        ? kcGrey100.withOpacity(0.2)
                        : const Color(0xFFD8DADC),
                  ),
                  borderRadius: BorderRadius.circular(sr(8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode ? kcGrey100.withOpacity(0.7) : kcBlack,
                  ),
                  borderRadius: BorderRadius.circular(sr(8)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kcErrorColor),
                  borderRadius: BorderRadius.circular(sr(8)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode
                        ? kcGrey100.withOpacity(0.2)
                        : const Color(0xFFD8DADC),
                  ),
                  borderRadius: BorderRadius.circular(sr(8)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode
                        ? kcGrey100.withOpacity(0.2)
                        : const Color(0xFFD8DADC),
                  ),
                  borderRadius: BorderRadius.circular(sr(8)),
                ),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.inter(
                  color: isDarkMode
                      ? Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .color!
                          .withOpacity(0.3)
                      : const Color(0xFF8A8A8A),
                  fontWeight: FontWeight.w500,
                  fontSize: sp(13),
                ),
                prefixIcon: widget.prefix,
                suffixIcon: _buildSuffixWidget(value),
              ),
              keyboardType: widget.textInputType,
              obscureText: value && widget.isPassword,
              validator: (String? val) {
                if (val == null || widget.validator == null) return null;

                return widget.validator!(val.trim());
              },
              onChanged: (String val) {
                if (widget.onChanged == null) return;

                widget.onChanged!(val.trim());
              },
              onFieldSubmitted: (String val) {
                if (widget.onSubmitted == null) return;

                widget.onSubmitted!(val.trim());
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSuffixWidget(value) {
    if (widget.suffixWidget != null) {
      return widget.suffixWidget!;
    } else if (widget.isPassword == true) {
      return suffixWidget(value);
    } else {
      if (widget.suffix != null) {
        return Icon(widget.suffix);
      } else {
        return const SizedBox();
      }
    }
  }

  IconButton suffixWidget(bool value) {
    if (value) {
      return IconButton(
        icon: const Icon(CupertinoIcons.eye_slash_fill),
        color: const Color(0xFFA0AFB4),
        onPressed: () => obscureText.value = !obscureText.value,
      );
    } else {
      return IconButton(
        icon: const Icon(CupertinoIcons.eye_fill),
        color: const Color(0xFFA0AFB4),
        onPressed: () => obscureText.value = !obscureText.value,
      );
    }
  }
}
