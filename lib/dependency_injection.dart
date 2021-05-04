//DI
import 'package:get_it/get_it.dart';
import 'package:mi_house_reception/core/db/database.dart';
import 'package:mi_house_reception/core/requests/http_handler.dart';
import 'package:mi_house_reception/core/token/token.dart';

final sl = GetIt.instance;

void setupDI() {
  sl.allowReassignment = true;

  //Provider

  //Data Sources
  //registerLazySingleton<Type>(()=>Object)

  //Repository
  //registerLazySingleton<Type>(()=>Object)

  //Core-External
  //registerLazySingleton<Type>(()=>Object)
  sl.registerLazySingleton<Database>(() => Database());
  sl.registerLazySingleton<Token>(() => Token(dbClient: sl()));
  sl.registerLazySingleton<HttpHandler>(() => HttpHandlerImpl(token: sl()));
}
