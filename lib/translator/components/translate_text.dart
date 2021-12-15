import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qazlogin/translator/components/action_button.dart';
import 'package:qazlogin/translator/components/custom_card.dart';
import 'package:qazlogin/translator/provider/translator_provider.dart';

class TranslateText extends StatefulWidget {
  @override
  _TranslateTextState createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TranslatorData>(context);
    return CustomCard(
      cardColor: Colors.purple[50],
      expandedChild: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0),
        child: Text(
          provider.translatedData,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
      actionButtonList: [
        ActionButton(
          iconData: Icons.copy,
          onPressed: () => FlutterClipboard.copy(provider.translatedData),
        ),
        // ActionButton(
        //   iconData: Icons.paste,
        //   onPressed: () {},
        // ),
        // ActionButton(
        //   iconData: Icons.volume_up,
        //   onPressed: () {},
        // ),

        SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
