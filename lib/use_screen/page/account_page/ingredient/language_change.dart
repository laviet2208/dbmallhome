import 'package:dbmallhome/data/finaldata.dart';
import 'package:dbmallhome/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class language_change extends StatefulWidget {
  final VoidCallback event;
  const language_change({super.key, required this.event});

  @override
  State<language_change> createState() => _language_changeState();
}

class _language_changeState extends State<language_change> {

  Future<void> saveLang(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      content: Container(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () async {
                finaldata.mainlanguage = finaldata.vi;
                await saveLang('language', 'VI');
                widget.event();
                toastMessage('Cập nhật thành công');
                setState(() {

                });
              },
              autofocus: false,
              child: Container(
                child: Text(
                  'Tiếng Việt',
                  style: TextStyle(
                    fontFamily: 'muli',
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () async {
                finaldata.mainlanguage = finaldata.en;
                await saveLang('language', 'ENG');
                widget.event();
                toastMessage('Update success');
                setState(() {

                });
              },
              autofocus: false,
              child: Container(
                child: Text(
                  'English',
                  style: TextStyle(
                    fontFamily: 'muli',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
