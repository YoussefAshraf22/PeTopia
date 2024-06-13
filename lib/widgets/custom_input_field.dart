import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool suffixIcon;
  final IconData prefixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInputField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.suffixIcon = false,
      this.isDense,
      this.obscureText = false,
      this.controller,
      required this.prefixIcon});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#00347D")),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(250, 192, 113, 1),
                border: Border.all(
                  color: HexColor("#00347D"),
                )),
            child: TextFormField(
              obscureText: (widget.obscureText && _obscureText),
              decoration: InputDecoration(
                isDense: (widget.isDense != null) ? widget.isDense : false,
                hintText: widget.hintText,
                prefixIcon: Icon(
                  widget.prefixIcon,
                  color: HexColor("#00347D"),
                ),
                suffixIcon: widget.suffixIcon
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_outlined,
                          color: HexColor("#00347D"),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                suffixIconConstraints: (widget.isDense != null)
                    ? const BoxConstraints(maxHeight: 33)
                    : null,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (textValue) {
                if (textValue == null || textValue.isEmpty) {
                  return 'required!';
                }
                return null;
              },
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}
