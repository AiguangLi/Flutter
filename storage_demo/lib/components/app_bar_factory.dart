import 'package:flutter/material.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
class AppBarFactory {
	static AppBar buildDefaultAppBar(String title) {
		return AppBar(title: Text(title));
	}
	
	static AppBar buildCenterAppBar(String title) {
		return AppBar(title: Text(title), centerTitle: true);
	}
}
