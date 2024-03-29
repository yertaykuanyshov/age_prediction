import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../config.dart';

abstract class FileRepository {
  Future<File> getImage();
}

class FileRepositoryImpl implements FileRepository {
  final _picker = ImagePicker();

  @override
  Future<File> getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
    );

    return File(pickedFile!.path);
  }
}
