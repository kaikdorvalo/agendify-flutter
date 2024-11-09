import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextInput extends StatefulWidget {
  String label;
  String? hint;
  String? labelText;
  String value;
  List<MaskTextInputFormatter>? masks;
  IconData icon;
  final Function(String) changeValue;

  TextInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.changeValue,
    required this.value,
    this.hint,
    this.labelText,
    this.masks,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.text = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            left: 15.0,
            right: 15.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF323141),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            decoration: InputDecoration(
              hintText: widget.hint ?? '',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 158, 158, 158),
              ),
              labelText: widget.labelText ?? '',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 158, 158, 158),
              ),
              icon: Icon(
                widget.icon,
                color: Color.fromARGB(255, 33, 149, 243),
              ),
              border: InputBorder.none,
            ),
            inputFormatters: widget.masks ?? [],
            controller: controller,
            onChanged: (value) {
              widget.changeValue(value);
            },
          ),
        ),
      ],
    );
  }
}
