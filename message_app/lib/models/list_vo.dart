import 'package:message_app/models/list_pager.dart';
import 'model_make_service.dart';

class ListVO<T> {
  ListPager pager;
  List<T> _listItems;
  List<T> get listItems => _listItems;

  ListVO(ModelMakeService modelMake, Map<String, dynamic> response) {
    //防止后台传的数据类型不正确
    int pageNum = (response['pageNum'] is int) ? response['pageNum'] : int.parse(response['pageNum']);
    int pages = (response['pages'] is int) ? response['pages'] : int.parse(response['pages']);
    int total = (response['total'] is int) ? response['total'] : int.parse(response['total']);
    int pageSize = (response['pageSize'] is int) ? response['pageSize'] : int.parse(response['pageSize']);

    pager = ListPager(pageNum, pages, total, pageSize);

    _listItems = List<T>();
    //ToDo：处理异常数据类型
    if (response.containsKey('list') && response['list'] is List) {
      for (var item in response['list']) {
        _listItems.add(modelMake.makeModel(item));
      }
    }
  }
}
