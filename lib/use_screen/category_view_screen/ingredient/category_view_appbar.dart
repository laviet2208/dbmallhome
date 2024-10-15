import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class category_view_appbar extends StatelessWidget {
  final String name;
  const category_view_appbar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
      ],
    );
  }
}
