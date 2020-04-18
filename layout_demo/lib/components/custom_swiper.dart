import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

enum SwiperImageSource { local, network }

class CustomSwiper extends StatefulWidget {
  final List<String> imagePaths;
  final double height;
  final double width;
  final SwiperImageSource source;
  CustomSwiper.imageSwiper(
      this.imagePaths, this.height, this.width, this.source
  );

  _CustomerSwiperState createState() => _CustomerSwiperState();
}

class _CustomerSwiperState extends State<CustomSwiper> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        child: Swiper(
          duration: 2000,
          itemCount: widget.imagePaths.length,
          autoplay: true,
          itemBuilder: (context, index) {
            return Container(
              width: widget.width,
              height: widget.height,
              child: widget.source == SwiperImageSource.local
                  ? Image.asset(
                      widget.imagePaths[index],
                      fit: BoxFit.cover,
                      ///图片填充整个父组件
                    )
                  : Image.network(
                      widget.imagePaths[index],
                      fit: BoxFit.cover,

                      ///图片填充整个父组件
                    ),
            );
          },
          pagination: SwiperPagination(),

          ///翻页控件
          //control: SwiperControl(),
        ));
  }
}
