import 'package:flutter/material.dart';

class voucher_app_bar extends StatelessWidget {
  const voucher_app_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20 * (460/76),
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/dbvouchertext.png'),
              )
          ),
        ),

        Expanded(child: Container()),
      ],
    );
  }
}
