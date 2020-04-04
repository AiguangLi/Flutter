import 'package:flutter/material.dart';

/*
Text即文本标签，常用属性如下：
data：String,文本内容
maxLines：int, 最大行数，0表示不限制
style：TextStyle，可设定字体，颜色，粗细等
textAlign：TextAlign，默认居中，包括left，center，end，justify，right，start，values
textDirection：TextDirection，文本方向，默认从左到右，即ltr，也可以rtl（从右到左）
textScaleFactor：double，默认1.0,字体缩放系数
textSpan，TextSpan，文本块，可以包含文本内容及样式
 */
class TextDemo extends StatelessWidget {
	final String title;
	TextDemo({Key key, this.title});
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text( this.title)),
			body: Center(
				child: Column(
					children: <Widget>[
						Text(
							'斜体删除线文字示例',
							style: TextStyle(
								color: const Color(0xffff0000),
								decoration: TextDecoration.lineThrough,
								decorationColor: const Color(0xff000000),
								fontSize: 18.0,
								fontStyle: FontStyle.italic,
								fontWeight: FontWeight.bold,
								letterSpacing: 2.0,
							),
						),
						Text(
							'橙色+下划线+24号',
							style: TextStyle(
								color: const Color(0xffff9900),
								decoration: TextDecoration.underline,
								fontSize: 24.0,
							),
						),
						Text(
							'虚线+上划线+20号',
							style: TextStyle(
								decoration: TextDecoration.overline,
								decorationStyle: TextDecorationStyle.dashed,
								fontSize: 20.0,
							),
						),
						Text(
							'斜体+16号+字间距6+粗体',
							style: TextStyle(
								fontSize: 16.0,
								fontStyle: FontStyle.italic,
								fontWeight: FontWeight.bold,
								letterSpacing: 6.0,
							),
						),
					],
				),
			)
		);
		
	}
}