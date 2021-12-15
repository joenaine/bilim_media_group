import 'package:qazlogin/pages/cleaningPages/cleaning.dart';
import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning3.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Unit3 extends StatefulWidget {
  @override
  _Unit3State createState() => _Unit3State();
}

class _Unit3State extends State<Unit3> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '3-ТАҚЫРЫП',
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
            builder: (context) => Cleaning3(),
          ));
        },
        label: Text('Продолжить'),
        icon: Icon(Icons.arrow_forward_rounded),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: SfPdfViewer.asset(
          'assets/units/unit_3.pdf',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
