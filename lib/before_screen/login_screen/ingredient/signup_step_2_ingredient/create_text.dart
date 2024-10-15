import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

class create_text extends StatelessWidget {
  const create_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        finaldata.mainlanguage.createapass,
        style: TextStyle(
          fontFamily: 'muli',
          fontSize: 100,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
