import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_your_table_waiter/core/external/api_handler.dart';
import 'package:on_your_table_waiter/core/logger/logger.dart';
import 'package:on_your_table_waiter/features/restaurant/models/restaurant_model.dart';

final restaurantDataSourceProvider = Provider<RestaurantDataSource>((ref) {
  return RestaurantDataSourceImpl.fromRead(ref);
});

abstract class RestaurantDataSource {
  Future<RestaurantModel> getRestaurant(String tableId);
}

class RestaurantDataSourceImpl implements RestaurantDataSource {
  RestaurantDataSourceImpl(this.apiHandler);

  factory RestaurantDataSourceImpl.fromRead(Ref ref) {
    return RestaurantDataSourceImpl(ref.read(apiHandlerProvider));
  }

  final ApiHandler apiHandler;

  @override
  Future<RestaurantModel> getRestaurant(String tableId) async {
    try {
      final res = await apiHandler.get('/menu/get-menu/$tableId');
      return RestaurantModel.fromMap(res.responseMap!);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
