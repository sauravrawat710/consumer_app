// import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Color? cursorColor;
  final Color? iconColor;
  final bool readOnly;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.focusNode,
    required this.textEditingController,
    this.textInputType,
    this.validator,
    this.isPassword = false,
    this.cursorColor,
    this.iconColor,
    this.readOnly = false,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    // final _isDarkMode =
    //     AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
      width: 0.9.sw,
      decoration: BoxDecoration(
        // color: _isDarkMode ? Colors.grey[700] : Colors.grey[200],
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(29.r),
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType: widget.textInputType,
        cursorColor: widget.cursorColor,
        obscureText: widget.isPassword ? _isObscure : false,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: widget.iconColor,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () => setState(() {
                        _isObscure = !_isObscure;
                      }),
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                  ))
              : null,
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
