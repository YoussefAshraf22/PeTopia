import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationInput extends StatelessWidget {
  const VerificationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
          child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 40,
            child: TextFormField(
              //ship to the next focus
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.number,
              
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          )
        ],
      )),
    );
  }
}
