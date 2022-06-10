import 'package:get/get.dart';
import 'package:pitjarus/service/dbhelper.dart';

class StoreDetailController extends GetxController{
  var id = Get.arguments;
  var isLoading = true.obs;
  List<Map<String, dynamic>> storesDetail = [];

  @override
  void onInit() {
    print(id);
    getDetail();
    print('dataaa $storesDetail');
    super.onInit();
  }
//get all item from local storage
  void getDetail() async{
    final data = await SQLHelper.getItem(id);
    storesDetail = data;
    print(storesDetail);
    isLoading(false);
  }
//update item local storage
void Update() async{
  print('ID dataa ${id}');
  final data = await SQLHelper.updateItem(id, 1);
}

}