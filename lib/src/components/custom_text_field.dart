import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      required this.icon,
      required this.label,
      this.isSecret = false,
      this.initialValue,
      this.inputFormatters,
      this.readOnly = false,
      this.validator,
      this.controller,
      this.keyboardType});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          inputFormatters: widget.inputFormatters,
          obscureText: isObscure,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(isObscure
                        ? Icons.visibility
                        : Icons.visibility_off_outlined),
                  )
                : null,
            prefixIcon: Icon(widget.icon),
            labelText: widget.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ));
  }
}
