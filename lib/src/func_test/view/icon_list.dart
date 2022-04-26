import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/font_awesome_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'progress_bar.dart';
import 'datepicker_button.dart';

class IconList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: [
              Contents(icon: giftIcon, text: 'test'),
              Contents(icon: wikiIcon, text: 'wikiのリンク', url_button_visible: true,),
              Contents(icon: cakeIcon, text: 'test'),
              Contents(icon: bibleIcon, text: 'test'),
              Contents(icon: globeIcon, text: 'test'),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: ProgressBar(),
              ),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                child: dateTimePicker()
              ),
            ],
          ),
        ),
      )
    );
  }
}

class Contents extends StatelessWidget {
  final Widget icon;
  final String text;
  final bool url_button_visible;

  const Contents({
    Key? key,
    required this.icon,
    required this.text,
    this.url_button_visible = false
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri _url = Uri.parse('https://ja.wikipedia.org/wiki/');
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: Colors.grey.shade200,
          )
        )
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(24),
              child: icon,
            ),
          ),
          // Container(
          //   width: 1,
          //   height: double.infinity,
          //   margin: EdgeInsets.symmetric(vertical: 8.0),
          // ),
          Expanded(
            flex: 2,
            child: Text(text),
          ),
          Visibility(
            visible: url_button_visible,
            child: IconButton(
              icon: googleIcon,
              onPressed: () async {
                if (!await launchUrl(_url)) throw 'Could not launch $_url';
              },
            ),
          )
        ],
      ),
    );
  }
}