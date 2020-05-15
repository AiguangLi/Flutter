import '../models/contactor_model.dart';
import '../../models/model_make_service.dart';

class ContactorMakeImpl implements ModelMakeService {
  static ContactorMakeImpl _instance;

  static ContactorMakeImpl getSharedInstance() {
    if (_instance == null) {
      _instance = ContactorMakeImpl._();
    }

    return _instance;
  }

  ContactorMakeImpl._();

  @override
  ContactorModel makeModel(Map<String, dynamic> json) {
    return ContactorModel(json);
  }

}