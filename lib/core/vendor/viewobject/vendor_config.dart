import 'package:sooq/core/vendor/viewobject/common/ps_object.dart';

class VendorConFig extends PsObject<VendorConFig>{
 VendorConFig({
  this.vendorFeatureSetting,
  this.vendorSubscriptionSetting
 });

  String? vendorFeatureSetting;
  String? vendorSubscriptionSetting;

  @override
  VendorConFig fromMap(dynamic dynamicData) {
   return VendorConFig(
    vendorFeatureSetting: dynamicData['vendor_feature_setting'],
    vendorSubscriptionSetting: dynamicData['vendor_subscription_setting']
   );
  }

  @override
   List<VendorConFig> fromMapList(List<dynamic> dynamicDataList) {
    final List<VendorConFig> blogList = <VendorConFig>[];

    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        blogList.add(fromMap(dynamicData));
      }
    }
    return blogList;
  }

  @override
  String? getPrimaryKey() {
   return '';
  }

  @override
  Map<String, dynamic>? toMap(VendorConFig? object) {
   if(object !=null){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendor_feature_setting'] = object.vendorFeatureSetting;
    data['vendor_subscription_setting'] = object.vendorSubscriptionSetting;
    return data;
   }else{
   return null;

   }
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<VendorConFig?> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (VendorConFig? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }

}