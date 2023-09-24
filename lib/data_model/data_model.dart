

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  int? success;
  bool? error;
  List<ProductList>? productList;
  PageInfo? pageInfo;

  ProductDetails({
    this.success,
    this.error,
    this.productList,
    this.pageInfo,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    success: json["Success"],
    error: json["error"],
    productList: json["ProductList"] == null ? [] : List<ProductList>.from(json["ProductList"]!.map((x) => ProductList.fromJson(x))),
    pageInfo: json["PageInfo"] == null ? null : PageInfo.fromJson(json["PageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "error": error,
    "ProductList": productList == null ? [] : List<dynamic>.from(productList!.map((x) => x.toJson())),
    "PageInfo": pageInfo?.toJson(),
  };
}

class PageInfo {
  int? pageNo;
  int? pageSize;
  int? pageCount;
  int? totalRecordCount;

  PageInfo({
    this.pageNo,
    this.pageSize,
    this.pageCount,
    this.totalRecordCount,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    pageNo: json["PageNo"],
    pageSize: json["PageSize"],
    pageCount: json["PageCount"],
    totalRecordCount: json["TotalRecordCount"],
  );

  Map<String, dynamic> toJson() => {
    "PageNo": pageNo,
    "PageSize": pageSize,
    "PageCount": pageCount,
    "TotalRecordCount": totalRecordCount,
  };
}

class ProductList {
  int? id;
  Type? type;
  String? parentCode;
  String? name;
  String? code;
  double? price;
  double? costPrice;
  UnitName? unitName;
  String? categoryName;
  String? brandName;
  String? modelName;
  String? variantName;
  String? sizeName;
  String? colorName;
  int? oldPrice;
  String? imagePath;
  int? commissionAmount;
  int? commissionPer;
  int? pctn;
  String? productBarcode;
  String? description;
  List<List<int>>? childList;
  List<BatchSerial>? batchSerial;
  List<WarehouseList>? warehouseList;
  int? currentStock;
  String? createDate;
  String? updateDate;

  ProductList({
    this.id,
    this.type,
    this.parentCode,
    this.name,
    this.code,
    this.price,
    this.costPrice,
    this.unitName,
    this.categoryName,
    this.brandName,
    this.modelName,
    this.variantName,
    this.sizeName,
    this.colorName,
    this.oldPrice,
    this.imagePath,
    this.commissionAmount,
    this.commissionPer,
    this.pctn,
    this.productBarcode,
    this.description,
    this.childList,
    this.batchSerial,
    this.warehouseList,
    this.currentStock,
    this.createDate,
    this.updateDate,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    id: json["Id"],
    type: typeValues.map[json["Type"]]!,
    parentCode: json["ParentCode"],
    name: json["Name"],
    code: json["Code"],
    price: json["Price"]?.toDouble(),
    costPrice: json["CostPrice"]?.toDouble(),
    unitName: unitNameValues.map[json["UnitName"]]!,
    categoryName: json["CategoryName"],
    brandName: json["BrandName"],
    modelName: json["ModelName"],
    variantName: json["VariantName"],
    sizeName: json["SizeName"],
    colorName: json["ColorName"],
    oldPrice: json["OldPrice"],
    imagePath: json["ImagePath"],
    commissionAmount: json["CommissionAmount"],
    commissionPer: json["CommissionPer"],
    pctn: json["PCTN"],
    productBarcode: json["ProductBarcode"],
    description: json["Description"],
    childList: json["ChildList"] == null ? [] : List<List<int>>.from(json["ChildList"]!.map((x) => List<int>.from(x.map((x) => x)))),
    batchSerial: json["BatchSerial"] == null ? [] : List<BatchSerial>.from(json["BatchSerial"]!.map((x) => BatchSerial.fromJson(x))),
    warehouseList: json["WarehouseList"] == null ? [] : List<WarehouseList>.from(json["WarehouseList"]!.map((x) => WarehouseList.fromJson(x))),
    currentStock: json["CurrentStock"],
    createDate: json["CreateDate"],
    updateDate: json["UpdateDate"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Type": typeValues.reverse[type],
    "ParentCode": parentCode,
    "Name": name,
    "Code": code,
    "Price": price,
    "CostPrice": costPrice,
    "UnitName": unitNameValues.reverse[unitName],
    "CategoryName": categoryName,
    "BrandName": brandName,
    "ModelName": modelName,
    "VariantName": variantName,
    "SizeName": sizeName,
    "ColorName": colorName,
    "OldPrice": oldPrice,
    "ImagePath": imagePath,
    "CommissionAmount": commissionAmount,
    "CommissionPer": commissionPer,
    "PCTN": pctn,
    "ProductBarcode": productBarcode,
    "Description": description,
    "ChildList": childList == null ? [] : List<dynamic>.from(childList!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "BatchSerial": batchSerial == null ? [] : List<dynamic>.from(batchSerial!.map((x) => x.toJson())),
    "WarehouseList": warehouseList == null ? [] : List<dynamic>.from(warehouseList!.map((x) => x.toJson())),
    "CurrentStock": currentStock,
    "CreateDate": createDate,
    "UpdateDate": updateDate,
  };
}

class BatchSerial {
  String? batchSerialNo;
  int? batchQty;
  int? amount;
  String? purchaseDate;
  String? supplierName;

  BatchSerial({
    this.batchSerialNo,
    this.batchQty,
    this.amount,
    this.purchaseDate,
    this.supplierName,
  });

  factory BatchSerial.fromJson(Map<String, dynamic> json) => BatchSerial(
    batchSerialNo: json["BatchSerialNo"],
    batchQty: json["BatchQty"],
    amount: json["Amount"],
    purchaseDate: json["PurchaseDate"],
    supplierName: json["SupplierName"],
  );

  Map<String, dynamic> toJson() => {
    "BatchSerialNo": batchSerialNo,
    "BatchQty": batchQty,
    "Amount": amount,
    "PurchaseDate": purchaseDate,
    "SupplierName": supplierName,
  };
}

enum Type {
  C,
  S
}

final typeValues = EnumValues({
  "C": Type.C,
  "S": Type.S
});

enum UnitName {
  FEET,
  KG,
  LITER,
  METER,
  MILIGRAM,
  PCS,
  PER_TRIP
}

final unitNameValues = EnumValues({
  "Feet": UnitName.FEET,
  "KG": UnitName.KG,
  "Liter": UnitName.LITER,
  "meter": UnitName.METER,
  "miligram": UnitName.MILIGRAM,
  "PCS": UnitName.PCS,
  "Per Trip": UnitName.PER_TRIP
});

class WarehouseList {
  int? costCalculatedId;
  String? whShortName;
  int? currentStock;
  double? averageCosting;
  double? costingValue;
  int? salesValue;

  WarehouseList({
    this.costCalculatedId,
    this.whShortName,
    this.currentStock,
    this.averageCosting,
    this.costingValue,
    this.salesValue,
  });

  factory WarehouseList.fromJson(Map<String, dynamic> json) => WarehouseList(
    costCalculatedId: json["CostCalculatedId"],
    whShortName: json["WhShortName"],
    currentStock: json["CurrentStock"],
    averageCosting: json["AverageCosting"]?.toDouble(),
    costingValue: json["CostingValue"]?.toDouble(),
    salesValue: json["SalesValue"],
  );

  Map<String, dynamic> toJson() => {
    "CostCalculatedId": costCalculatedId,
    "WhShortName": whShortName,
    "CurrentStock": currentStock,
    "AverageCosting": averageCosting,
    "CostingValue": costingValue,
    "SalesValue": salesValue,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
