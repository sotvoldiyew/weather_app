import 'package:weather_app/src/common/constants/constants.dart';
import 'package:weather_app/src/common/model/model.dart';
import 'package:weather_app/src/common/sevirce/api_servire.dart';
import 'package:weather_app/src/feature/home/data/home_repository.dart';

class ApiData {
 static  List<AssistModel> model = [];

 static Future<void> getModel() async {
    final getResult = await ApiService.request(Constants.altyaryk);
    final baseModel = HomeRepositoryImpl.get(getResult ?? "");
    model = [];
    model.add(baseModel);
  }
}
