import 'package:flutter/material.dart';
import 'package:marriage/data/model/login_info_model.dart';

class EditDialog extends StatefulWidget {
  EditDialog({Key? key, required this.loginInfoModel}) : super(key: key);

  LoginInfoModel loginInfoModel;

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController ageController;
  late TextEditingController weightController;
  late TextEditingController heightController;

  @override
  void initState() {
    ageController = TextEditingController(
        text: widget.loginInfoModel.usersData.age.toString());
    weightController = TextEditingController(
        text: widget.loginInfoModel.usersData.weight.toString());
    heightController = TextEditingController(
        text: widget.loginInfoModel.usersData.height.toString());
    super.initState();
  }

  @override
  void dispose() {
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'Enter your age',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: TextFormField(
              controller: weightController,
              decoration: const InputDecoration(
                hintText: 'Enter your weight',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: TextFormField(
              controller: heightController,
              decoration: const InputDecoration(
                hintText: 'Enter your height',
                border: InputBorder.none,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Editdailogue(BuildContext context, TextEditingController controller, int age) {
  return showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 400,
          child: AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter your age',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter your weight',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter your height',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ]),
          ),
        );
      });
}
