
import 'package:sport_app/app/services/remote/laravel/export/services_exports.dart' as Laravel;
import 'package:sport_app/core/enums/service_provider.dart';

class ServiceContainer{

  static T? getService<T>({required ServiceProvider serviceProvider}){
    Map<Type, T Function()> services = <Type, T Function()>{

    };

    return services[T]?.call();
  }
}