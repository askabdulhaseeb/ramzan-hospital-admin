import 'package:image_picker/image_picker.dart';

class ImageFunctions {
  Future<XFile?> imageFromGalary() async {
    final XFile? _image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_image == null) return null;
    return _image;
  }
}
