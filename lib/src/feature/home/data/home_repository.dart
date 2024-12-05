import 'dart:convert';

import 'package:weather_app/src/common/model/model.dart';

abstract interface class IHomeRepository {
  IHomeRepository();
}

class HomeRepositoryImpl implements IHomeRepository {
  static AssistModel get(String json) {
    final Map<String, Object?> getJson = jsonDecode(json);
    final model = AssistModel.fromJson(getJson);
    return model;
  }
}
