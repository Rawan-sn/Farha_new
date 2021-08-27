import 'package:farha_app/models/user_model.dart';
import 'package:farha_app/provider/profile_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  //UserModel model = new UserModel();
  final _profileController = PublishSubject<UserModel>();

  Stream<UserModel> get profileStream => _profileController.stream;
  final _isLoadingController = PublishSubject<bool>();

  ///متحولات بوليان مشان اعرف اذا لسا عم تجيب معلومات ولا خلصت
  get isLoadingStream => _isLoadingController.stream;

  clearProfile() {
    _profileController.sink.add(null);
  }

  getProfile(BuildContext context) {
    _isLoadingController.sink.add(true);
    ApiProfile(context).getProfile().then((value) {
      if (value != null) {
        if (!_profileController.isClosed) {
          _profileController.sink.add(UserModel.fromMap(value.data));
        }
        if (!_isLoadingController.isClosed) {
          _isLoadingController.sink.add(false);
        }
      }
    });
  }

  void dispose() {
    _profileController.close();
    _isLoadingController.close();
  }
}
