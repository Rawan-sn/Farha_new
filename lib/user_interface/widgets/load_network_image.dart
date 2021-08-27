import 'package:cached_network_image/cached_network_image.dart';
import 'package:farha_app/helper/custom_cache_manager.dart';
import 'package:farha_app/helper/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadNetworkImage extends StatelessWidget {
  final String src;
  final bool isCustomCacheManager;
  final LoadingType loadingType;
  final BoxFit fit;
  final double width;
  final double height;

  const LoadNetworkImage({
    @required this.src,
    this.isCustomCacheManager = true,
    this.loadingType = LoadingType.threeBounce,
    // this.errorAssetsType = ErrorAssetsType.vehicle,
    this.fit = BoxFit.cover,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: isCustomCacheManager ? CustomCacheManager.instance : null,
      fit: fit,
      width: width,
      height: height,
      imageUrl: src ?? "",
      placeholder: (context, url) {
        switch (loadingType) {
          case LoadingType.fadingCube:
            return Center(
              child: SpinKitFadingCube(
                color: Colors.yellow[700],
                size: 20,
              ),
            );
            break;
          case LoadingType.circularProgress:
            return CircularProgressIndicator();
            break;
          default:
            return Center(
              child: SpinKitThreeBounce(
                color: Colors.yellow[700],
                size: 20,
              ),
            );
        }
      },
    );
  }
}
