import 'package:flutter/material.dart';

jaam(BuildContext context, Widget widget) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
out(BuildContext context) => Navigator.of(context).pop();
