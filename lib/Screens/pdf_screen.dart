import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfScreen extends StatelessWidget {
  final String path;

  const PdfScreen({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // PDFView(
    //   filePath: path,
    // );
  }
}
