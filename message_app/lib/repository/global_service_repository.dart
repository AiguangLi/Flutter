import 'package:get_it/get_it.dart';
import '../message/service/message_service.dart';
import '../message/impl/message_service_impl.dart';
import 'package:plugins/logger/abstract_logger.dart';
import 'package:plugins/logger/file_logger.dart';
import '../message/view_model/message_store.dart';
import '../global_services/user_login_service.dart';

class GlobalServiceRepository {
  static void resisterServices() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<MessageService>(() => MessageServiceImpl());
    getIt.registerLazySingleton<Logger>(() => FileLogger());
    getIt.registerLazySingleton<MessageStore>(() => MessageStore());
    getIt.registerLazySingleton<List<UserLoginService>>(() {
      return [getService<MessageStore>()];
    });
  }

  static T getService<T>() {
    GetIt getIt = GetIt.instance;
    return getIt<T>();
  }
}
