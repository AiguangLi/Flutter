import 'package:flutter/material.dart';

/**
 * GridView可以使用count或者extend创建
 * count通过单行展示个数创建，extend通过最大宽度创建
 */
class GridViewDemoPage extends StatelessWidget {
	final String title;
	GridViewDemoPage({Key key, this.title});
	
	List<Widget> generateGridItems(int count) {
		List<Widget> list = List<Widget>();
		
		for (int i = 0; i < count; ++i) {
			Container grid = Container (
				decoration: BoxDecoration(
					image: DecorationImage(
						image: NetworkImage('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4099493327,2236798276&fm=26&gp=0.jpg'),
						fit: BoxFit.cover,
					),
					shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
					borderRadius: new BorderRadius.all(
						const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
					),
				),
			);
			list.add(grid);
		}
		
		return list;
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold (
			appBar: AppBar(
				title: Text(this.title),
			),
			body: GridView.count (
				primary: false, //是否与父节点的PrimaryScrollController所关联的主滚动视图
				padding: const EdgeInsets.all(10.0),	//四周的空隙
				crossAxisSpacing: 10.0,  //列间距
				mainAxisSpacing: 10.0,   //行间距
				crossAxisCount: 3,
				children: generateGridItems(14),
			)
		);
	}
}