import 'package:qazlogin/pages/cleaningPages/cleaning.dart';
import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning2.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Unit2 extends StatefulWidget {
  @override
  _Unit2State createState() => _Unit2State();
}

class _Unit2State extends State<Unit2> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2-ТАҚЫРЫП',
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
            builder: (context) => Cleaning2(),
          ));
        },
        label: Text('Продолжить'),
        icon: Icon(Icons.arrow_forward_rounded),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: SfPdfViewer.asset(
          'assets/units/unit_2.pdf',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
