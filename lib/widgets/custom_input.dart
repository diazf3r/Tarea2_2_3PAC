import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  CustomInput({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.icon = Icons.person,
    this.maxLength = 10,
    this.keyboardType = TextInputType.text,
    required this.validator,
  }) : super(key: key);

  IconData icon;
  var validator;
  var maxLength;
  var keyboardType;
  var label;
  var controller;
  bool obscureText;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.keyboardType == TextInputType.visiblePassword
          ? _obscureText
          : false,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        labelText: 'ingrese su ${widget.label}',
        prefixIcon: Icon(widget.icon),
        suffixIcon:
          widget.keyboardType == TextInputType.visiblePassword 
          ? IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
              color: _obscureText ? Colors.grey : Colors.blue,
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ) 
          : null,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
      ),
    );
  }
}
