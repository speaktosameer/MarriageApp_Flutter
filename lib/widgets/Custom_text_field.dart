import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
        this.textInputAction = TextInputAction.next,
        this.obsecuretext = false,
        required this.text1,
        required this.controller,
        required this.hinttext,
        this.title,
        this.labeltext,
        this.suffixicon,
        this.errorText,
        this.validate})
      : super(key: key);

  final String text1;
  TextEditingController controller;
  final String hinttext;
  final String? errorText;
  final String? labeltext;
  final String? title;
  final String? Function(String?)? validate;
  bool obsecuretext;
  Widget? suffixicon;
  TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obsecuretext,
          validator: validate,
          controller: controller,
          textInputAction: textInputAction,
          decoration: InputDecoration(
              suffixIcon: suffixicon,
              labelText: labeltext,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hinttext,
              focusedBorder: outlinefocusBorder(color: Colors.deepOrange),
              enabledBorder: outlinefocusBorder(),
              errorBorder: outlinefocusBorder(color: Colors.red),
              focusedErrorBorder: outlinefocusBorder(color: Colors.red)),
        ),
      ]),
    );
  }

  OutlineInputBorder outlinefocusBorder({Color color = Colors.black}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        gapPadding: 0.2,
        borderRadius: BorderRadius.circular(15));
  }
}
