class Strores {
  List<Strores1>? strores;

  Strores({this.strores});

  Strores.fromJson(Map<String, dynamic> json) {
    this.strores = json["strores"]==null ? null : (json["strores"] as List).map((e)=>Strores1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.strores != null)
      data["strores"] = this.strores?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Strores1 {
  String? storeId;
  String? storeCode;
  String? storeName;
  String? address;
  String? dcId;
  String? dcName;
  String? accountId;
  String? accountName;
  String? subchannelId;
  String? subchannelName;
  String? channelId;
  String? channelName;
  String? areaId;
  String? areaName;
  String? regionId;
  String? regionName;
  String? latitude;
  String? longitude;

  Strores1({this.storeId, this.storeCode, this.storeName, this.address, this.dcId, this.dcName, this.accountId, this.accountName, this.subchannelId, this.subchannelName, this.channelId, this.channelName, this.areaId, this.areaName, this.regionId, this.regionName, this.latitude, this.longitude});

  Strores1.fromJson(Map<String, dynamic> json) {
    this.storeId = json["store_id"];
    this.storeCode = json["store_code"];
    this.storeName = json["store_name"];
    this.address = json["address"];
    this.dcId = json["dc_id"];
    this.dcName = json["dc_name"];
    this.accountId = json["account_id"];
    this.accountName = json["account_name"];
    this.subchannelId = json["subchannel_id"];
    this.subchannelName = json["subchannel_name"];
    this.channelId = json["channel_id"];
    this.channelName = json["channel_name"];
    this.areaId = json["area_id"];
    this.areaName = json["area_name"];
    this.regionId = json["region_id"];
    this.regionName = json["region_name"];
    this.latitude = json["latitude"];
    this.longitude = json["longitude"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["store_id"] = this.storeId;
    data["store_code"] = this.storeCode;
    data["store_name"] = this.storeName;
    data["address"] = this.address;
    data["dc_id"] = this.dcId;
    data["dc_name"] = this.dcName;
    data["account_id"] = this.accountId;
    data["account_name"] = this.accountName;
    data["subchannel_id"] = this.subchannelId;
    data["subchannel_name"] = this.subchannelName;
    data["channel_id"] = this.channelId;
    data["channel_name"] = this.channelName;
    data["area_id"] = this.areaId;
    data["area_name"] = this.areaName;
    data["region_id"] = this.regionId;
    data["region_name"] = this.regionName;
    data["latitude"] = this.latitude;
    data["longitude"] = this.longitude;
    return data;
  }
}