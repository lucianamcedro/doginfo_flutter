import 'package:doginfo/domain/ui/dog_info_icons.dart';
import 'package:flutter/material.dart';

class DogTextForm extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  DogTextForm(
      {Key? key,
      required this.label,
      this.obscureText = false,
      this.suffixIconButton,
      this.controller,
      this.validator})
      : assert(
          obscureText == true ? suffixIconButton == null : true,
          'Obscure Text não pode ser enviado em conjunto com SuffixIconButton',
        ),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.grey[200],
            labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            isDense: true,
            suffixIcon: suffixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !obscureTextValue;
                        },
                        icon: Icon(
                          !obscureTextValue
                              ? DogInfo.eye_slash
                              : DogInfo.eye_slash,
                          size: 15,
                        ),
                      )
                    : null),
          ),
          obscureText: obscureTextValue,
        );
      },
    );
  }
}
