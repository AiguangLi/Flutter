import 'dart:io';

import 'package:image_picker/image_picker.dart';

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class ImagePickerUtil {
 
  static Future<File> pickImage(
      ImageSource source, double width, double height, int quality) async {
    File imageFile = await ImagePicker.pickImage(
        source: source,
        maxWidth: width,
        maxHeight: height,
        imageQuality: quality);

    return imageFile;
  }
}
