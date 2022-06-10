import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pitjarus/login/login.dart';
import 'package:pitjarus/service/dbhelper.dart';
import 'package:pitjarus/store_detail/store_detail.dart';
import 'package:pitjarus/stores/controller/stores_controller.dart';

class Stores extends StatefulWidget {
  const Stores({Key? key}) : super(key: key);

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {

  List<Map<String, dynamic>> stores = [];
  static List list = [];
  bool loading = true;
  var cek = true;

  void refreshstores() async {
    final data = await SQLHelper.getItems();
    stores = data;
    print('list dataa $stores');

  }

@override
void initState() {
  refreshstores();
  loading = false;
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    final getdata = Get.put(StoresController());
    return Scaffold(
        body: loading ?
            Center(child: CircularProgressIndicator(),)
            : Column(
              children: [
                Container(
                  height: Get.height * 0.4,
                  width: Get.width,
                  child: GoogleMap(
                    myLocationEnabled: true,
                    initialCameraPosition:CameraPosition(target: getdata.initialcameraposition,zoom: 14.4746),
                    onMapCreated: (GoogleMapController controller) {
                      getdata.controller.complete(controller);
                    },
                    markers: Set.from(getdata.markers),
                    // markers: _markers,
                  ),
                ),
                Container(
                  height: Get.height * 0.55,
                  width: Get.width,
                  child: ListView.builder(
                    itemCount: stores.length,
                    itemBuilder: (BuildContext context, int index) {

                      if (stores[index]["visit"] == 0) {
                        print('false');
                        print(stores[index]["visit"]);
                        cek = false;
                      } else {
                        print('true');
                        print(stores[index]["visit"]);
                        cek = true;
                      }
                      return Container(
                        height: 80,
                        child: InkWell(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        // Text(getdata.stores[index]["id"].toString()),
                                        Text(stores[index]["storeName"]),
                                        SizedBox(height: 5),
                                        Text(stores[index]["storeCode"]),
                                        SizedBox(height: 5),
                                        Text(stores[index]["address"]),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Visibility(
                                      visible: cek,
                                      child: Row(
                                        children: [
                                          Icon(Icons.verified_rounded,
                                              color: Colors.green),
                                          Text("Perfect Store",
                                              style: TextStyle(
                                                  color: Colors.green
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            color: Colors.green),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            print(stores[index]["id"]);
                            Get.to(() => StoreDetail(idContact: stores[index]["id"]),
                            arguments:stores[index]["id"]);
                            // Get.to(StoreDetail(idContact: getdata.stores[index]["id"]));
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: Get.height*0.05,
                  child: IconButton(
                      onPressed: (){
                        for(var i = 0;i<stores.length;i++){
                          print(stores[i]["id"]);
                          getdata.deleteall(stores[i]["id"]);
                          Get.offAll(Login());
                        };
                      },
                      icon: Icon(Icons.logout_rounded,
                      color: Colors.red,)),
                )
              ],
            )



    );
  }
}

