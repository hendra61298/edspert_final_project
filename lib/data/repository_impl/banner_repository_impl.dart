
import 'package:flutter/foundation.dart';
import 'package:submission_finpro/domain/entities/banner_data.dart';
import 'package:submission_finpro/domain/repository/banner_repository.dart';

import '../../common/const/urls.dart';
import '../models/response/banner/banner_response.dart';
import '../services/dio_client.dart';

class BannerRepositoryImpl extends BannerRepository{
  final DioClient dioClient;

  BannerRepositoryImpl(this.dioClient);

  @override
  Future<List<BannerData>> getBanners({int? limit}) async {
    try {
      Map<String, dynamic>? queryParams;
      if (limit != null) {
        queryParams = {"limit": limit};
      }
      final result = await dioClient.get(Urls.banners, queryParameters: queryParams);

      BannerResponse res = BannerResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getBanners: $e, $stackTrace');
      }
      return [];
    }
  }
  
}