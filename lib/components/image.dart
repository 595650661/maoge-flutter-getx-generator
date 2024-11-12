import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ducafecat_news_getx/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 缓存图片
Widget netImageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry? margin,
}) {
  print("=============== url: $url");
  return CachedNetworkImage(
    imageUrl:
        "https://www.keaitupian.cn/cjpic/frombd/2/253/1676065055/2828606542.jpg",
    imageBuilder: (context, imageProvider) => Container(
      height: height.h,
      width: width.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radii.k6pxRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
