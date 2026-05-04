import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetFoodByBarcodeCall {
  static Future<ApiCallResponse> call({
    String? barcode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFoodByBarcode',
      apiUrl: 'https://world.openfoodfacts.org/api/v0/product/${barcode}.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product.product_name''',
      ));
  static double? carbohydrates(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.carbohydrates_100g''',
      ));
  static double? proteins(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.proteins_100g''',
      ));
  static double? fats(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.product.nutriments.fat_100g''',
      ));
  static int? kilojoules(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.product.nutriments.energy_100g''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
