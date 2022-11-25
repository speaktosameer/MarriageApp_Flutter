import 'package:flutter/cupertino.dart';
import 'package:marriage/utils/sizeboxs.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Change Password'),
        Text(
            'Your password must have minimunm of 6 characters. We recommend you to choose an alphanumeric password eg:Matril123'),
        Sizeboxes(),
      ],
    );
  }
}
