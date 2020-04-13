import 'package:flutter/material.dart';

/// @author: LiOS
/// @email: aiguang.li@qq.com
/// @date: 2020/4/13
///
class PageList extends StatefulWidget {
	_PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
	@override
	void initState() {
		super.initState();
		
		pageNames = {
			'1. Container':'/container', '2. Center':'/center', '3. Align':'/align',
			'4. Fitted Box':'/fitted-box', '8. Stack/Alignment':'/container',
			'9. Stack/Positioned':'/container', '10. IndexedStack':'/container', '11. OverflowBox':'/container',
			'12. SizedBox':'/container', '13. ConstraintedBox':'/container', '14. AspectedRatio':'/container',
			'15. FractionallySizedBox':'/container', '16. ListView':'/container', '17. GridView':'/container',
			'18. Transform':'/container', '19. Baseline':'/container', '20. OffStage ':'/container', '21. Wrap':'/container',
			'22. Composite Example':'/container'
		};
	}
	
	Map<String, String> pageNames;
	
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('示例导航')),
			body: ListView.builder(
				itemCount: pageNames.keys.length,
				controller: ScrollController(),
				itemBuilder: (context, index)  {
					return ListTile(
						title: Text(pageNames.keys.elementAt(index)),
						onTap: () {
							Navigator.pushNamed(context, pageNames[pageNames.keys.elementAt(index)]);
						},
					);
				}),
		);
	}
}