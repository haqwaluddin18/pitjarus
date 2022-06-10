import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus/login/controller/login_controller.dart';
import 'package:pitjarus/service/dbhelper.dart';
import 'package:pitjarus/stores/stores.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  TextEditingController passwordCtr = TextEditingController(text: 'admin');
  TextEditingController emailCtr = TextEditingController(text: 'pitjarus');

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LoginController getdata = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.height*0.25,
                width: Get.width,
                color: Colors.white,
                child: Image.asset('images/Vector22.png',
                fit:BoxFit.cover),
              ),
              Container(
                width: Get.width,
                height: Get.height*0.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                TextFormField(
                                  controller: emailCtr,
                                  validator: (value) {
                                    return (value == null || value.isEmpty)
                                        ? 'Please Enter Username'
                                        : null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0),
                                      ),
                                      filled: true,
                                      hintStyle:
                                      TextStyle(color: Colors.grey),
                                      hintText: "Email",
                                      fillColor: Colors.white70),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    return (value == null || value.isEmpty)
                                        ? 'Please Enter Password'
                                        : null;
                                  },
                                  controller: passwordCtr,
                                  obscureText: !passwordVisible,
                                  // style: regular4.copyWith(color: primaryText),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    // contentPadding: padTextField,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                    ),
                                    suffixIcon: IconButton(
                                    color: Colors.grey,
                                    splashRadius: 1,
                                    icon: Icon(passwordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: togglePassword,
                                  ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Keep Username',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.update),
                                          Text(
                                            'Check Update',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Obx(() {
                                  if (getdata.isLoading.value == true) {
                                    return const Center(child: CircularProgressIndicator());
                                  } else {
                                    return  Container(
                                      width: Get.width * 1,
                                      height: 35,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            await getdata.logintest(emailCtr.text, passwordCtr.text);
                                          }
                                          // _addItem();
                                          print(' statuuus ${getdata.status}');
                                          print(' statuuus ${getdata.stores.isEmpty}');
                                            for(var i = 0; i<getdata.stores.length;i++) {
                                              print('masuk for');
                                              _addItem(
                                                  getdata.stores[i].storeId!,
                                                  getdata.stores[i].storeCode!,
                                                  getdata.stores[i].storeName!,
                                                  getdata.stores[i].address!,
                                                  getdata.stores[i].dcId!,
                                                  getdata.stores[i].dcName!,
                                                  getdata.stores[i].accountId!,
                                                  getdata.stores[i]
                                                      .accountName!,
                                                  getdata.stores[i]
                                                      .subchannelId!,
                                                  getdata.stores[i]
                                                      .subchannelName!,
                                                  getdata.stores[i].channelId!,
                                                  getdata.stores[i]
                                                      .channelName!,
                                                  getdata.stores[i].areaId!,
                                                  getdata.stores[i].areaName!,
                                                  getdata.stores[i].regionId!,
                                                  getdata.stores[i].regionName!,
                                                  getdata.stores[i].latitude!,
                                                  getdata.stores[i].longitude!,
                                                  0);
                                              Get.to(Stores());
                                            }
                                          // print('${getdata.stores[0].longitude},${getdata.stores[0].latitude}');
                                        },
                                        child: Text('Login'),
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all<
                                                Color>(Colors.blue),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      15.0),
                                                  side: BorderSide(
                                                      color: Colors.blue)),
                                            )),
                                      ),
                                    );
                                  }
                                }),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                height: Get.height*0.25,
                width: Get.width,
                color: Colors.white,
                child: Image.asset('images/Vector23.png',
                    fit:BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _addItem(
      String storeId ,
      String storeCode,
      String storeName,
      String address,
      String dcId,
      String dcName,
      String accountId,
      String accountName,
      String subchannelId,
      String subchannelName,
      String channelId,
      String channelName,
      String areaId,
      String areaName,
      String regionId,
      String regionName,
      String latitude,
      String longitude,
      int visit) async {
    await SQLHelper.createItem(
        storeId,
        storeCode,
        storeName,
        address,
        dcId,
        dcName,
        accountId,
        accountName,
        subchannelId,
        subchannelName,
        channelId,
        channelName,
        areaId,
        areaName,
        regionId,
        regionName,
        latitude,
        longitude,
        0);
  }
}
