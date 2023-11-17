
import 'package:flutter/material.dart';

abstract class CommonRegister extends StatefulWidget {
  const CommonRegister({super.key});

  @override
  State<CommonRegister> createState() => _CommonRegisterState();

  List<String> getOptions();
  String getQuestionText(); // Ekledik
}

class _CommonRegisterState extends State<CommonRegister> {
  int _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Color(0xFF519086),
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500);
    return Column(
      children: [
        Text(
          widget.getQuestionText(), // Değişiklik burada
          style: const TextStyle(
            color: Color(0xFF519086),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        for (int i = 0; i < widget.getOptions().length; i++)
          customContainer(
            child: ListTile(
              leading: Radio(
                value: i + 1,
                groupValue: _selectedOption,
                onChanged: (v) {
                  setState(() {
                    _selectedOption = v as int;
                  });
                },
              ),
              title: Text(
                widget.getOptions()[i],
                style: textStyle,
              ),
            ),
          ),
      ],
    );
  }

  Container customContainer({Widget? child}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0x3F519087),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: child,
    );
  }
}
