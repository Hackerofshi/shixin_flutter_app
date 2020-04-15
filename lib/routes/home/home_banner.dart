import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shixin_flutter_app/models/banner.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key key,
    @required List<BannerData> data,
  })  : _data = data,
        super(key: key);
  final List<BannerData> _data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: ScreenUtil.getInstance().setHeight(550),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return CachedNetworkImage(
              imageUrl: _data[index].imagePath,
              placeholder: (context, url) => Image.asset("assets/avatar-deafult.png"),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/avatar-deafult.png"),
            );
          },
          itemCount: _data.length,
          pagination: SwiperPagination(),
          autoplay: true,
          autoplayDisableOnInteraction: true,
          onTap: (index) {
            /*Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommonWebPage(
                title: _data[index].title,
                url: _data[index].url,
                id: _data[index].id,
              )));*/
          },
        ));
  }
}
