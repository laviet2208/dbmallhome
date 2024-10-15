import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class notice_app_bar extends StatelessWidget {
  const notice_app_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20,),

        Expanded(
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const AutoSizeText(
                  'Db Mall Notice',
                  style: TextStyle(
                    fontFamily: 'muli',
                    fontSize: 100,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10,),
      ],
    );
  }
}
