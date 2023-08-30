import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;

  const MyTextField({super.key, required this.myController});
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                    controller: myController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      ),
                      labelText: 'Cost of service',
                    ),
                  ),
                );
  }
}