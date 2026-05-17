// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow Imports
// DO NOT REMOVE OR MODIFY THE ABOVE CODE!

import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:zxing_lib/zxing.dart';
import 'package:zxing_lib/common.dart';

Future<String?> barcodeScan() async {
  // 1. Al ejecutarse esta acción por tu toque, abre la cámara real
  final ImagePicker picker = ImagePicker();
  final XFile? photo;

  try {
    photo = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
      maxWidth: 1200,
      maxHeight: 1200,
    );
  } catch (e) {
    return null; // Si no da permiso
  }

  // Si cancela la cámara
  if (photo == null) return null;

  // 2. Lee el código matemático invisiblemente
  try {
    final Uint8List bytes = await photo.readAsBytes();
    final img.Image? image = img.decodeImage(bytes);
    if (image == null) return null;

    final Int32List int32Pixels = Int32List(image.width * image.height);
    int i = 0;
    for (final pixel in image) {
      int r = pixel.r.toInt();
      int g = pixel.g.toInt();
      int b = pixel.b.toInt();
      int32Pixels[i++] = (255 << 24) | (r << 16) | (g << 8) | b;
    }

    final RGBLuminanceSource source =
        RGBLuminanceSource(image.width, image.height, int32Pixels);
    final BinaryBitmap bitmap = BinaryBitmap(HybridBinarizer(source));
    final MultiFormatReader reader = MultiFormatReader();

    final Result result = reader.decode(bitmap);

    // 3. Devuelve el código de barras
    return result.text;
  } catch (e) {
    // Si la foto está muy borrosa
    return null;
  }
}
