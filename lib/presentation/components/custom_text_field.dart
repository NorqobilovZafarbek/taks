import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_n1/presentation/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  final VoidCallback? onTap;
  final void Function()? onMapTapped;
  final void Function(String value)? onChange;
  final void Function(String value)? onSubmitted;
  final String? icon;
  final int? maxLine;
  final TextCapitalization textCapitalization;

  final List<TextInputFormatter>? formatters;

  const CustomTextField({
    super.key,
    this.maxLine,
    this.onTap,
    this.textEditingController,
    required this.hintText,
    this.icon,
    this.onMapTapped,
    this.formatters,
    this.textCapitalization = TextCapitalization.none,
    this.onChange,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, icons, fonts, controller) {
        return TextField(
          onTap: onTap,
          textInputAction: TextInputAction.search,
          onSubmitted: onSubmitted,
          maxLines: maxLine,
          controller: textEditingController,
          style: fonts.semiBold18,
          textCapitalization: textCapitalization,
          onChanged: onChange,
          decoration: InputDecoration(
            prefixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      icon!,
                      height: 20,
                      width: 20,
                    ),
                  )
                : null,
            filled: true,
            fillColor: colors.white,
            hintText: hintText,
            hintStyle: fonts.semiBold18.copyWith(
              color: colors.grey50,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textMainColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.textMainColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        );
      },
    );
  }
}
