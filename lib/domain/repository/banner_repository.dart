
import '../entities/banner_data.dart';

abstract class BannerRepository {
  Future<List<BannerData>> getBanners({int? limit});
}
