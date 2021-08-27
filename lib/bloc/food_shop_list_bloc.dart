import 'package:farha_app/models/all_service_beauty_center_model.dart';
import 'package:farha_app/models/all_service_food_shop_model.dart';
import 'package:farha_app/models/all_service_halls_model.dart';
import 'package:farha_app/provider/service_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class FoodShopListBloc {
  int page = 0;
  bool hasNext = true;
  bool loadData = false;

  final _foodShopController = PublishSubject<ServiceFoodShopModel>();

  get beautyCenterStream => _foodShopController.stream;

  final _isLoadingController = PublishSubject<bool>();

  get isLoadingStream => _isLoadingController.stream;

  clearBeautyCenter() {
    page = 1;
    hasNext = true;
    _foodShopController.sink.add(null);
    loadData = false;
  }

  getFoodShops(BuildContext context, String type) {
    if (!loadData && this.hasNext) {
      loadData = true;
      print("********** GetListFoodShops **********");
      _isLoadingController.sink.add(true);
      ApiService(context).getService(type, this.page).then((webSer) {
        loadData = false;
        if (webSer != null) {
          if (!_foodShopController.isClosed) {
            _foodShopController.sink
                .add(ServiceFoodShopModel.fromMap(webSer.data));
          }
          if (webSer.data.currentPage < webSer.data.totalPages) {
            this.hasNext = true;
            this.page++;
          } else {
            this.hasNext = false;
          }
          if (!_isLoadingController.isClosed) {
            _isLoadingController.sink.add(false);
          }
        }
      });
    }
  }

  void dispose() {
    _foodShopController.close();
    _isLoadingController.close();
  }
}
