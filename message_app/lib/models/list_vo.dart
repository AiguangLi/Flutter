import 'package:message_app/models/list_pager.dart';

import 'model_make_service.dart';

class ListVO<T> {
  ListPager pager;
  List<T> _listItems;
  List<T> get listItems => _listItems;

  ListVO(ModelMakeService modelMake, Map<String, dynamic> response) {
    pager = ListPager(response['pageNum'] ?? 1, response['pages'] ?? 0,
        response['total'] ?? 0, response['pageSize'] ?? 20);
    _listItems = List<T>();
    if (response.containsKey('list')) {
      List<Map<String, dynamic>> list =
          response['list'] as List<Map<String, dynamic>>;
      for (var item in list) {
        _listItems.add(modelMake.makeModel(item));
      }
    }
  }
}
