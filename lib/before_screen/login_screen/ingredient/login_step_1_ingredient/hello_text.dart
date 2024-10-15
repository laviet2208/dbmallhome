import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallhome/data/finaldata.dart';
import 'package:flutter/material.dart';

class hello_text extends StatelessWidget {
  const hello_text({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 40,
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            finaldata.mainlanguage.hello,
            style: TextStyle(
              fontFamily: 'muli',
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Container(height: 5,),

        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            finaldata.mainlanguage.hello1,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'muli',
              fontSize: width/25,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
