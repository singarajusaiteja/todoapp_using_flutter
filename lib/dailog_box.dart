import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a New Task"
              ),
            ),

            //button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              //save button
              MyButton(text: 'save', onPressed: onSave),
              
              //cancel button
              MyButton(text: 'cancel', onPressed: onCancel)
            ],
            )
          ],
        ),
      ),
    );
  }
}
