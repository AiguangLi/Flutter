import 'package:get_it/get_it.dart';
import '../message/service/message_service.dart';
import '../message/impl/message_service_impl.dart';
import '../error_exception/service/error_service.dart';
import '../error_exception/impl/error_service_impl.dart';

class GlobalServiceRepository {
  static void resisterServices() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<MessageService>(() => MessageServiceImpl());
  }

  static void resisterErrorService() {
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<ErrorService>(ErrorServiceImpl());
  }

  static T getService<T>() {
    GetIt getIt = GetIt.instance;
    return getIt<T>();
  }
}