import '../contactor_model.dart';
import '../../models/list_vo.dart';
import '../service/contactor_service.dart';
import 'package:date_format/date_format.dart';
import '../impl/contactor_make_impl.dart';
import '../../utils/data_mock.dart';

class ContactorServiceImpl implements ContactorService {
  ContactorServiceImpl._();

  static ContactorServiceImpl _instance;

  static ContactorServiceImpl getSharedInstance() {
    if (_instance == null) {
      _instance = ContactorServiceImpl._();
    }

    return _instance;
  }

  @override
  Future<String> deleteContactor(String contactorId) async {
    return contactorId;
  }

  @override
  Future<ContactorModel> getContactor(String contactorId) async {
    return ContactorModel({
      'name': 'Name $contactorId',
      'mobile': DataMock.generateMobile(),
      'avatar':
          'http://upload.huifuwu.cn/UserCenter/Avatar/202005/1221625340534620.jpg',
      'firstChar':
          formatDate(DateTime.now(), [mm, '-', dd, ' ', hh, ':', nn]),
    });
  }

  @override
  Future<ListVO<ContactorModel>> listContactor(
      int currentPage, int pageSize) async {
    List<Map<String, dynamic>> list = List.generate(pageSize, (index) {
      Map<String, dynamic> map = Map();
      map['name'] = 'Name ${(currentPage-1)*pageSize + index}';
      map['mobile'] = DataMock.generateMobile();
      map['avatar'] =
          'http://upload.huifuwu.cn/UserCenter/Avatar/202005/1221625340534620.jpg';
      // var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ#';
      var firstChar = '#';
      if ((currentPage-1)*pageSize + index < 4) {
        firstChar = 'A';
      } else if((currentPage-1)*pageSize + index < 10) {
        firstChar = 'B';
      } else {
        firstChar = 'C';
      }
      map['firstChar'] = firstChar;

      return map;
    });

    return ListVO<ContactorModel>(ContactorMakeImpl.getSharedInstance(), {
      'pageNum': currentPage,
      'pageSize': pageSize,
      'pages': 2,
      'total': 2 * pageSize,
      'list': list
    });
  }

  @override
  Future<String> sendContactor(ContactorModel contactor) async {
    return '1';
  }
}
