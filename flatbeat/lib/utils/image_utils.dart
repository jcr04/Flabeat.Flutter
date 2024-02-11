import 'dart:convert';
import 'dart:typed_data';

class ImageUtils {
  static Uint8List safeBase64Decode(String source) {
    try {
      return base64.decode(source);
    } catch (e) {
      return Uint8List(0);
    }
  }
}
