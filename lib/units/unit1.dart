import 'package:qazlogin/pages/cleaningPages/cleaning.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Unit1 extends StatefulWidget {
  @override
  _Unit1State createState() => _Unit1State();
}

class _Unit1State extends State<Unit1> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '1-ТАҚЫРЫП',
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
            builder: (context) => CleaningPage(),
          ));
        },
        label: Text('Продолжить'),
        icon: Icon(Icons.arrow_forward_rounded),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: SfPdfViewer.asset(
          'assets/units/unit_1.pdf',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
