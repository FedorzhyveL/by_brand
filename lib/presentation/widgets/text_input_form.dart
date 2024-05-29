import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputForm extends StatefulWidget {
  const TextInputForm({
    super.key,
    this.autoFocus = false,
    this.enabled = true,
    this.obscureText = false,
    this.error = false,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconTap,
    this.hint,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.label,
    this.textInputFormatters,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.focusNode,
    this.autofillHints,
    this.onSubmitted,
    this.enabledBorderColor,
    this.onChanged,
    required this.textController,
    this.backGroundColor,
    this.contentPadding,
    this.hintStyle,
    this.suffix,
  });

  final bool autoFocus;
  final bool enabled;
  final bool obscureText;
  final bool error;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconTap;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String? hint;
  final String? label;
  final Color? enabledBorderColor;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? textInputFormatters;
  final TextEditingController textController;
  final List<String>? autofillHints;
  final Function(String)? onSubmitted;
  final Color? backGroundColor;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;
  final Widget? suffix;

  @override
  State<TextInputForm> createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
  bool suffixEnabled = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        setState(() {
          suffixEnabled = widget.focusNode!.hasFocus == true && widget.textController.text.isNotEmpty;
        });
      });
      widget.textController.addListener(() {
        setState(() {
          suffixEnabled = widget.focusNode!.hasFocus == true && widget.textController.text.isNotEmpty;
        });
      });
    } else {
      widget.textController.addListener(() {
        setState(() {
          suffixEnabled = widget.textController.text.isNotEmpty;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      textInputAction: TextInputAction.done,
      keyboardType: widget.textInputType,
      enabled: widget.enabled,
      textCapitalization: widget.textCapitalization,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      controller: widget.textController,
      autofocus: widget.autoFocus,
      obscureText: widget.obscureText,
      obscuringCharacter: '•',
      cursorWidth: 2,
      autofillHints: widget.autofillHints,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        label: Text(widget.label ?? ''),
        filled: true,
        error: widget.error ? Container() : null,
        suffixIcon: suffixEnabled && widget.suffixIcon != null
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => widget.suffixIconTap?.call(),
                icon: Icon(
                  widget.suffixIcon,
                  size: 24,
                ),
              )
            : null,
        contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
      ),
      inputFormatters: widget.textInputFormatters,
    );
  }
}
