
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/services.dart' show ByteData, rootBundle;

import 'dart:typed_data';


class MusicStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadAudio() async {
    try {
      String filePath = 'assets/audios/XXXTentacion.mp3';
      ByteData audioData = await rootBundle.load(filePath);
      List<int> bytes = audioData.buffer.asUint8List();

      Reference reference = _storage.ref().child('audios/XXXTentacion.mp3');
      UploadTask uploadTask = reference.putData(Uint8List.fromList(bytes));
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Erro ao fazer upload do áudio: $e');
      rethrow;
    }
  }
}

Future<String> getStorageId(String downloadUrl) {
  if (downloadUrl.isEmpty) {
    throw 'URL de download está vazia';
  }
  Uri uri = Uri.parse(downloadUrl);
  return Future.value(uri.path);
}