import 'dart:convert';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ConverterRepository {
  ConverterRepository._();

  static Configuration config = Configuration(
    outputType: ImageOutputType.webpThenJpg,
    // can only be true for Android and iOS while using ImageOutputType.jpg or ImageOutputType.pngÏ
    useJpgPngNativeCompressor: false,
    // set quality between 0-100
    quality: 30,
  );

  static imagePickerToBase64({required }) async {
    final ImagePicker picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if(file != null) {
      final param = ImageFileConfiguration(input: ImageFile(filePath: file.path, rawBytes: await file.readAsBytes()), config: config);
      final output = await compressor.compress(param);
        String base64 = base64Encode(output.rawBytes);
        return base64;
    }
    return null;
  }

  static base64ToBytes<Uint8List>({required String image}) {
    return base64Decode(image.split("base64,").last);
  }
}