import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CalendarioAcademico extends StatefulWidget {
  const CalendarioAcademico({Key? key}) : super(key: key);

  @override
  State<CalendarioAcademico> createState() => _CalendarioAcademicoState();
}

class _CalendarioAcademicoState extends State<CalendarioAcademico> {

  Future<File> loadPdf() async {
    var url = 'https://ifpr.edu.br/paranavai/wp-content/uploads/sites/21/2023/01/Copia-de-CALENDARIO-2023-FINAL-Calendario-2023_publicacao.pdf';
    final response = await get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = basename(url);
    var file = File('/data/user/0/com.example.if_diario/cache/$filename');
    return file.writeAsBytes(bytes, flush: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var status = await Permission.storage.status;
          if (status != PermissionStatus.granted) {
            status = await Permission.storage.request();
          }
          if (status.isGranted) {
            const downloadsFolderPath = '/storage/emulated/0/Download/';
            Directory dir = Directory(downloadsFolderPath);
            // file = File('${dir.path}/$file');
          }
        },
        child: const Icon(Icons.download),
      ),
      appBar: AppBar(
        title: const Text("Calendário acadêmico"),
      ),
      body: FutureBuilder(
        future: loadPdf(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData) {
            File file = snapshot.data as File;
            return PDFView(
              filePath: file.path,
            );
          } else {
            return const Text("Pdf não encontrado");
          }
        }
      ),
    );
  }
}
