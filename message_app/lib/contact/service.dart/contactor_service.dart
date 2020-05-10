import '../contactor_model.dart';
import 'package:message_app/models/list_vo.dart';

abstract class ContactorService {
  Future<ListVO<ContactorModel>> listContactor(int currentPage, int pageSize);
  Future<ContactorModel> getContactor(String contactorId);
  Future<String> sendContactor(ContactorModel contactor);
  Future<String> deleteContactor(String contactorId);
}