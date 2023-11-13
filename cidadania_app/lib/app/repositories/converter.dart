import 'dart:convert';
import 'package:cidadania_app/app/repositories/load_overlay.dart';
import 'package:flutter/material.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:routefly/routefly.dart';

class ConverterRepository {
  ConverterRepository._();

  static Configuration config = Configuration(
    outputType: ImageOutputType.jpg,
    // can only be true for Android and iOS while using ImageOutputType.jpg or ImageOutputType.pngÏ
    useJpgPngNativeCompressor: false,
    // set quality between 0-100
    quality: 30,
  );

  static imagePickerToBase64({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery, maxWidth: 200);
    if(file != null) {
      LoadOverlay.getLoad("Carregando Imagem", context);/* 
      final param = ImageFileConfiguration(input: ImageFile(filePath: file.path, rawBytes: ), config: config);
      final output = await compressor.compress(param); */
        String base64 = base64Encode(await file.readAsBytes());
        Routefly.pop(context);
        return base64;
    }
    return null;
  }

  static base64ToBytes<Uint8List>({required String image}) {
    return base64Decode(image);
  }
}