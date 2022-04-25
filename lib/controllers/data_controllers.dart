import 'package:flutter_payment_app/services/data_services.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var list = [].obs;
  var _loading = false.obs;

  get loading => _loading.value;
  final service = new DataServices();

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  _loadData() async {
    _loading.value = false;
    try {
      list.addAll(await service.getUsers());
    } catch (e) {
      printError(info: e.toString());
    } finally {
      _loading.value = true;
    }
  }
}
