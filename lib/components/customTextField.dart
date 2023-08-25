import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField(
      {super.key,
      required TextEditingController userNameController,
     this.obscureText,
      required this.hintText})
      : _userNameController = userNameController;

  final TextEditingController _userNameController;
  final String hintText;
  bool? obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _userNameController,
      obscureText: obscureText!,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(2),
            hintText: hintText,
            
            border: InputBorder.none),
      ),
    );
  }
}