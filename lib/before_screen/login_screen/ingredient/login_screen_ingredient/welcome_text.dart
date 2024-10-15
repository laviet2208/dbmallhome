import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

class welcome_text extends StatelessWidget {
  const welcome_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        finaldata.mainlanguage.welcome,
        style: TextStyle(
          fontFamily: 'muli',
          fontSize: 100,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
