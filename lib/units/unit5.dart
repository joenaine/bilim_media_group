import 'package:qazlogin/pages/cleaningPages/cleaning.dart';
import 'package:flutter/material.dart';
import 'package:qazlogin/pages/cleaningPages/cleaning5.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Unit5 extends StatefulWidget {
  @override
  _Unit5State createState() => _Unit5State();
}

class _Unit5State extends State<Unit5> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '5-ТАҚЫРЫП',
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
            builder: (context) => Cleaning5(),
          ));
        },
        label: Text('Продолжить'),
        icon: Icon(Icons.arrow_forward_rounded),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: SfPdfViewer.asset(
          'assets/units/unit_5.pdf',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
