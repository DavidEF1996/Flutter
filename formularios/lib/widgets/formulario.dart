import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputsForm extends StatefulWidget {
  String nombreInput;
  TextInputType keboard;
  InputsForm({Key? key, required this.nombreInput, required this.keboard})
      : super(key: key);

  @override
  State<InputsForm> createState() => _InputsFormState();
}

class _InputsFormState extends State<InputsForm> {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
        maxLength: 16,
        keyboardType: widget.keboard,
        validationMessages: {'required': (error) => 'Campo requerido'},
        formControlName: widget.nombreInput);
  }
}
