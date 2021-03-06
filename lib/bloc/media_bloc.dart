// import 'dart:io';
// import 'package:farha_app/helper/general_func.dart';
// import 'package:farha_app/models/attachment_model.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:mime/mime.dart';
// import 'package:path_provider/path_provider.dart';
//
// class MediaBloc {
//   List<Attachment> attachments = List<Attachment>();
//   List<int> deletedAttachment = List<int>();
//
//   final _mediaListController = PublishSubject<List<Attachment>>();
//
//   get mediaListStream => _mediaListController.stream;
//
//   FilePickerResult _filePickerResult;
//   File _croppedFile;
//   final picker = ImagePicker();
//
//   void chosseImageExplorer(BuildContext context) async {
//     try {
//       _filePickerResult = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//       );
//       int size = await File(_filePickerResult.files.first.path).length();
//       print("Orginal file size: ${size / 1024} KB");
//       var fileType =
//           lookupMimeType(_filePickerResult.files.first.path.toString())
//               .split('/');
//       if (fileType.contains("image")) {
//         _croppedFile = await ImageCropper.cropImage(
//             sourcePath: _filePickerResult.files.first.path.toString(),
//             aspectRatioPresets: [
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio3x2,
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPreset.ratio16x9
//             ],
//             androidUiSettings: AndroidUiSettings(
//                 toolbarTitle: 'Cropper',
//                 toolbarColor: Colors.deepOrange,
//                 toolbarWidgetColor: Colors.white,
//                 initAspectRatio: CropAspectRatioPreset.original,
//                 lockAspectRatio: false),
//             iosUiSettings: IOSUiSettings(
//               minimumAspectRatio: 1.0,
//             ));
//         if (_croppedFile != null) {
//           int size2 = await File(_croppedFile.path).length();
//           print("Cropped file size: ${size2 / 1024} KB");
//           if (size == size2) {
//             Directory tempDir = await getTemporaryDirectory();
//             String targetPath =
//                 "${tempDir.path}/CompressedFile_${GeneralFanc.getNameFromMediaPath(_croppedFile.path)}";
//             var result = await FlutterImageCompress.compressAndGetFile(
//               _croppedFile.path,
//               targetPath,
//               quality: 75,
//             );
//             print("Compressed file size: ${result.lengthSync() / 1024} KB");
//             attachments.add(Attachment(
//               imageFileName: GeneralFanc.getNameFromMediaPath(result.path),
//               path: result.path,
//               image: GeneralFanc.pathTobase64Image(result.path),
//             ));
//           } else {
//             attachments.add(Attachment(
//               imageFileName:
//                   GeneralFanc.getNameFromMediaPath(_croppedFile.path),
//               path: _croppedFile.path,
//               image: GeneralFanc.pathTobase64Image(_croppedFile.path),
//             ));
//           }
//         }
//       }
//       _mediaListController.sink.add(attachments);
//     } on PlatformException catch (e) {
//       Fluttertoast.showToast(msg: '${e.message}');
//       print(e.toString());
//     } catch (r) {
//       Fluttertoast.showToast(msg: '$r');
//       print(r);
//     }
//   }
//
//   void addImagesForEditing(List<String> images) {
//     List<Attachment> oldAttachments = [];
//     for (var image in images) {
//       oldAttachments.add(Attachment(
//         path: image,
//       ));
//     }
//     _mediaListController.sink.add(oldAttachments);
//   }
//
//   getImageFromCamera() async {
//     try {
//       var image = await picker.getImage(source: ImageSource.camera);
//       int size = await File(image.path).length();
//       print("Orginal file size: ${size / 1024} KB");
//       _croppedFile = await ImageCropper.cropImage(
//           sourcePath: image.path,
//           aspectRatioPresets: [
//             CropAspectRatioPreset.square,
//             CropAspectRatioPreset.ratio3x2,
//             CropAspectRatioPreset.original,
//             CropAspectRatioPreset.ratio4x3,
//             CropAspectRatioPreset.ratio16x9
//           ],
//           androidUiSettings: AndroidUiSettings(
//               toolbarTitle: 'Cropper',
//               toolbarColor: Colors.deepOrange,
//               toolbarWidgetColor: Colors.white,
//               initAspectRatio: CropAspectRatioPreset.original,
//               lockAspectRatio: false),
//           iosUiSettings: IOSUiSettings(
//             minimumAspectRatio: 1.0,
//           ));
//       if (_croppedFile != null) {
//         int size2 = await File(_croppedFile.path).length();
//         print("Cropped file size: ${size2 / 1024} KB");
//         if (size == size2) {
//           Directory tempDir = await getTemporaryDirectory();
//           String targetPath =
//               "${tempDir.path}/CompressedFile_${GeneralFanc.getNameFromMediaPath(_croppedFile.path)}";
//           var result = await FlutterImageCompress.compressAndGetFile(
//             _croppedFile.path,
//             targetPath,
//             quality: 75,
//           );
//           print("Compressed file size: ${result.lengthSync() / 1024} KB");
//           attachments.add(Attachment(
//             imageFileName: GeneralFanc.getNameFromMediaPath(result.path),
//             path: result.path,
//             image: GeneralFanc.pathTobase64Image(result.path),
//           ));
//         } else {
//           attachments.add(Attachment(
//             imageFileName: GeneralFanc.getNameFromMediaPath(_croppedFile.path),
//             path: _croppedFile.path,
//             image: GeneralFanc.pathTobase64Image(_croppedFile.path),
//           ));
//         }
//       }
//       _mediaListController.sink.add(attachments);
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   deleteItem(int index) {
//     attachments.removeAt(index);
//     _mediaListController.sink.add(attachments);
//   }
//
//   void dispose() {
//     _mediaListController.close();
//   }
// }
