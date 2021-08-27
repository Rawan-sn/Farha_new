import 'package:farha_app/models/upload_image_model.dart';
import 'package:farha_app/provider/upload_image_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class UploadImageBloc {
  var file;
  final _uploadImageController = PublishSubject<UploadImageModel>();

  get uploadImageStream => _uploadImageController.stream;
  final _isLoadingController = PublishSubject<bool>();

  get isLoadingStream => _isLoadingController.stream;

  clearImage() {
    _uploadImageController.sink.add(null);
  }

  uploadImage(BuildContext context,String type) {
    _isLoadingController.sink.add(true);
    ApiUploadImage(context).upload(file,type).then((value) {
      if (value != null) {

        print("ttttttttttttttttttttt");
        if (!_uploadImageController.isClosed) {
          _uploadImageController.sink.add(UploadImageModel.fromMap(value.data));
        }
        if (!_isLoadingController.isClosed) {
          _isLoadingController.sink.add(false);
        }
      }
    });
  }

  void dispose() {
    _uploadImageController.close();
    _isLoadingController.close();
  }
}
