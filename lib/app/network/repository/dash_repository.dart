import 'dart:convert';

import 'package:stock_app/app/network/repository/base_repository.dart';
import 'package:stock_app/app/network/response/NewsResponse.dart';
import 'package:stock_app/app/network/response/StockListResponse.dart';

import '../api_end_points.dart';
import '../response/LoginResponse.dart';
import '../utils/network_result.dart';

class DashRepository extends BaseRepository{
  Future<NetworkResult<NewsResponse>> getNews(
      String email, String password) async {
    return get<NewsResponse>(ApiEndPoints.news, fromJson: NewsResponse.fromJson);
  }

  Future<NetworkResult<StockListResponse>> getStockList(Map<String,dynamic> query) async {
    return polygonGet<StockListResponse>(ApiEndPoints.tickers, fromJson: StockListResponse.fromJson,query: query);
  }
}