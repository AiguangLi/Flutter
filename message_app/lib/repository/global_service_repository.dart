import 'package:get_it/get_it.dart';
import '../message/service/message_service.dart';
import '../message/impl/message_service_impl.dart';

class GlobalServiceRepository {
  static void resisterServices() {
    GetIt getIt = GetIt.instance;
    //getIt.registerSingleton<MessageService>(MessageServiceImpl());
    getIt.registerLazySingleton<MessageService>(() => MessageServiceImpl());
    //getIt.registerFactory<MessageService>(() => MessageServiceImpl());
  }

  static T getService<T>() {
    GetIt getIt = GetIt.instance;
    return getIt<T>();
  }
}