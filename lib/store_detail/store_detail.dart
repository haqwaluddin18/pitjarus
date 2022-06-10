import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus/service/dbhelper.dart';
import 'package:pitjarus/store_detail/controller/store_detail_controller.dart';
import 'package:pitjarus/stores/stores.dart';

class StoreDetail extends StatefulWidget {
  const StoreDetail({Key? key, this.idContact}) : super(key: key);
  final int? idContact;

  @override
  State<StoreDetail> createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {

  // List<Map<String, dynamic>> storesDetail = [];
  // bool isLoading = true;
  // @override
  // void initState() {
  //   // print(widget.idContact);
  //   super.initState();
  //   getDetail(widget.idContact);
  //   isLoading = false;
  //
  // }
  //
  // void getDetail(dataid) async{
  //   print('masuk detail');
  //   final data = await SQLHelper.getItem(dataid);
  //   storesDetail = data;
  //   isLoading = false;
  //   print(storesDetail);
  // }
  //
  // void Update(dataid) async{
  //   final data = await SQLHelper.updateItem(dataid, 1);
  //   print('ID dataa ${dataid}');
  // }

  @override
  Widget build(BuildContext context) {
    final getdata = Get.put(StoreDetailController());
    return Scaffold(
      body:Obx(() {
        if(getdata.isLoading.value == true){
          return Center(child: CircularProgressIndicator());
        }else{
          return Stack(
            children: [
              Container(
                height: Get.height * 0.45,
                color: Colors.red,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Get.height * 0.42, left: 10, right: 10),
                    child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: Get.height * 0.4,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.map),
                                  ),
                                  SizedBox(width: 5),
                                  Text('alamat dmn aja'),
                                  SizedBox(width: 10),
                                  Container(
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Reset")),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.location_city, color: Colors.orange,),
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${getdata.storesDetail[0]["storeName"]}"),
                                      SizedBox(height: 5,),
                                      Text('alamat dmn aja'),
                                      SizedBox(height: 5,),
                                      Text(
                                          'Type Outlet        :${getdata.storesDetail[0]["dcName"]}'),
                                      SizedBox(height: 5,),
                                      Text(
                                          'Type Display     :${getdata.storesDetail[0]["accountName"]}'),
                                      SizedBox(height: 5,),
                                      Text(
                                          'Ertm                   :${getdata.storesDetail[0]["areaName"]}'),
                                      SizedBox(height: 5,),
                                      Text(
                                          'Pareto                 :${getdata.storesDetail[0]["regionId"]}'),
                                      SizedBox(height: 5,),
                                      Text(
                                          'E-Merchandise   :${getdata.storesDetail[0]["channelName"]}'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsets>(EdgeInsets.all(15)),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.red),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0),
                                            side: BorderSide(color: Colors.red)
                                        )
                                    )
                                ),
                                child: Text("No Visit"))),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 2,
                            child: ElevatedButton(
                                onPressed: () {
                                  print(getdata.storesDetail[0]["id"]);
                                  getdata.Update();
                                  Get.to(Stores());
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsets>(EdgeInsets.all(15)),
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.blue),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0),
                                            side: BorderSide(color: Colors.blue)
                                        )
                                    )
                                ),
                                child: Text("Visit"))),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        }

      }),
    );
  }
}

