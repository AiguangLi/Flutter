import 'package:multi_image_picker/multi_image_picker.dart';

enum ImageSource { photo, camera }

/*
 * 使用multi_image_picker获取图片
 * author: liag
 * date: 2020-05-28
 */
class PhotoImagePicker {
  static Future<Asset> pickOriginImage(ImageSource source, [int quality = 100]) async {
    List<Asset> assets = List<Asset>();
    bool enableCamera = source == ImageSource.camera;
    assets = await MultiImagePicker.pickImages(
        maxImages: 1, enableCamera: enableCamera);

    if (assets.length == 0) {
      return null;
    }

    return assets[0];
  }

  static Future<List<Asset>> pickMultiImage(int maxCount, int quality) async {
    List<Asset> assets = List<Asset>();
    assets = await MultiImagePicker.pickImages(
        maxImages: maxCount, enableCamera: false);

    return assets;
  }
}
