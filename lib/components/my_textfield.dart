import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final String hintText;
  final bool obsccureText;
  final TextEditingController controller;
  final FocusNode ? focusNode;

  const MyTextField ({
    super.key,
    required this.hintText,
    required this.obsccureText,
    required this.controller,
    this.focusNode,
  });


  @override
  Widget build(BuildContext context){

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: obsccureText,
        controller: controller,
        focusNode: focusNode,
        decoration:InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
            fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        )
      ),
    );
  }
}