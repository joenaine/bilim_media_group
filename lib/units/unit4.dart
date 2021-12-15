import 'package:qazlogin/pages/cleaningPages/cleaning.dart';
import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning4.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Unit4 extends StatefulWidget {
  @override
  _Unit4State createState() => _Unit4State();
}

class _Unit4State extends State<Unit4> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '4-ТАҚЫРЫП',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.grey[350],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Cleaning4(),
          ));
        },
        label: Text('Продолжить'),
        icon: Icon(Icons.arrow_forward_rounded),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: SfPdfViewer.asset(
          'assets/units/unit_4.pdf',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
