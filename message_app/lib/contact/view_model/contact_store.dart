import 'package:flutter/cupertino.dart';
import '../impl/contactor_service_impl.dart';
import '../models/contactor_model.dart';
import '../../models/list_pager.dart';
import '../../models/list_vo.dart';

class ContactorStore with ChangeNotifier {
  final BuildContext context;
  ContactorStore(this.context);

  List<ContactorModel> messageData;
  ListPager pager;
  bool isLoaded = false;
  bool hasMoreData = true;

  getListItems(int page, int pageSize, [Map<String, dynamic> params]) async {
    if (page == 1 || hasMoreData) {
      ListVO<ContactorModel> newData =
          await ContactorServiceImpl.getSharedInstance().listContactor(page, pageSize);
      if (page == 1) {
        messageData = newData?.listItems;
      } else {
        messageData.addAll(newData?.listItems);
      }
      pager = newData?.pager;

      if (pager == null || pager.nextPage <= pager.currentPage) {
        hasMoreData = false;
      } else {
        hasMoreData = true;
      }
      isLoaded = true;
      notifyListeners();
    }
  }
}
