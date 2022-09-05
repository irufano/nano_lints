import 'dart:convert';

final dynamic a = 'sdas';

DetailOrderBuyResponseModel detailOrderBuyResponseModelFromJson(String str) =>
    DetailOrderBuyResponseModel.fromJson(json.decode(str));

String detailOrderBuyResponseModelToJson(DetailOrderBuyResponseModel data) =>
    json.encode(data.toJson());

class DetailOrderBuyResponseModel {
  DetailOrderBuyResponseModel({
    this.status,
    this.data,
  });

  String? status;
  DetailOrderBuyData? data;

  factory DetailOrderBuyResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailOrderBuyResponseModel(
        status: json["status"],
        data: DetailOrderBuyData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class DetailOrderBuyData {
  DetailOrderBuyData({
    this.orderPaymentTypeId,
    this.orderCustomerName,
    this.orderAmount,
    this.orderQuantity,
    this.orderDate,
    this.productId,
    this.productPriceUnit,
    this.productDescription,
    this.productTravelers,
    this.productSellerNumber,
    this.orderDpAmount,
    this.orderDpPoint,
    this.orderDpInvoiceNumber,
    this.orderDpInvoiceDate,
    this.orderDpInvoiceStatus,
    this.orderDpPaymentType,
    this.orderDpPaymentTypeDetail,
    this.orderDpPaymentAccountDetail,
    this.orderFpAmount,
    this.orderFpPoint,
    this.orderFpInvoiceNumber,
    this.orderFpInvoiceDate,
    this.orderFpInvoiceStatus,
    this.orderFpPaymentType,
    this.orderFpPaymentTypeDetail,
    this.orderFpPaymentAccountDetail,
  });

  String? orderPaymentTypeId;
  String? orderCustomerName;
  double? orderAmount;
  int? orderQuantity;
  DateTime? orderDate;
  String? productId;
  double? productPriceUnit;
  String? productDescription;
  List<ProductTravelerBuyDetail>? productTravelers;
  String? productSellerNumber;
  double? orderDpAmount;
  double? orderDpPoint;
  String? orderDpInvoiceNumber;
  DateTime? orderDpInvoiceDate;
  String? orderDpInvoiceStatus;
  String? orderDpPaymentType;
  String? orderDpPaymentTypeDetail;
  String? orderDpPaymentAccountDetail;
  double? orderFpAmount;
  double? orderFpPoint;
  String? orderFpInvoiceNumber;
  DateTime? orderFpInvoiceDate;
  String? orderFpInvoiceStatus;
  String? orderFpPaymentType;
  String? orderFpPaymentTypeDetail;
  String? orderFpPaymentAccountDetail;

  factory DetailOrderBuyData.fromJson(Map<String, dynamic> json) =>
      DetailOrderBuyData(
        orderPaymentTypeId: json["orderPaymentTypeId"],
        orderCustomerName: json["orderCustomerName"],
        orderAmount: json["orderAmount"],
        orderQuantity: json["orderQuantity"],
        orderDate: DateTime.parse(json["orderDate"]),
        productId: json["productId"],
        productPriceUnit: json["productPriceUnit"],
        productDescription: json["productDescription"],
        productTravelers: List<ProductTravelerBuyDetail>.from(json["productTravelers"]
                .map((x) => ProductTravelerBuyDetail.fromJson(x))),
        productSellerNumber: json["productSellerNumber"],
        orderDpAmount: json["orderDpAmount"],
        orderDpPoint: json["orderDpPoint"],
        orderDpInvoiceNumber: json["orderDpInvoiceNumber"],
        orderDpInvoiceDate: json["orderDpInvoiceDate"] == null
            ? null
            : DateTime.parse(json["orderDpInvoiceDate"]),
        orderDpInvoiceStatus: json["orderDpInvoiceStatus"],
        orderDpPaymentType: json["orderDpPaymentType"],
        orderDpPaymentTypeDetail: json["orderDpPaymentTypeDetail"],
        orderDpPaymentAccountDetail: json["orderDpPaymentAccountDetail"],
        orderFpAmount: json["orderFpAmount"],
        orderFpPoint: json["orderFpPoint"],
        orderFpInvoiceNumber: json["orderFpInvoiceNumber"],
        orderFpInvoiceDate: json["orderFpInvoiceDate"] == null
            ? null
            : DateTime.parse(json["orderFpInvoiceDate"]),
        orderFpInvoiceStatus: json["orderFpInvoiceStatus"],
        orderFpPaymentType: json["orderFpPaymentType"],
        orderFpPaymentTypeDetail: json["orderFpPaymentTypeDetail"],
        orderFpPaymentAccountDetail: json["orderFpPaymentAccountDetail"],
      );

  Map<String, dynamic> toJson() => {
        "orderPaymentTypeId": orderPaymentTypeId,
        "orderCustomerName": orderCustomerName,
        "orderAmount": orderAmount,
        "orderQuantity": orderQuantity,
        "orderDate":
            "${orderDate?.year.toString().padLeft(4, '0')}-${orderDate?.month.toString().padLeft(2, '0')}-${orderDate?.day.toString().padLeft(2, '0')}",
        "productId": productId,
        "productPriceUnit": productPriceUnit,
        "productDescription": productDescription,
        "productTravelers":
            List<dynamic>.from(productTravelers!.map((x) => x.toJson())),
        "productSellerNumber": productSellerNumber,
        "orderDpAmount": orderDpAmount,
        "orderDpPoint": orderDpPoint,
        "orderDpInvoiceNumber": orderDpInvoiceNumber,
        "orderDpInvoiceDate": orderDpInvoiceDate,
        "orderDpInvoiceStatus": orderDpInvoiceStatus,
        "orderDpPaymentType": orderDpPaymentType,
        "orderDpPaymentTypeDetail": orderDpPaymentTypeDetail,
        "orderDpPaymentAccountDetail": orderDpPaymentAccountDetail,
        "orderFpAmount": orderFpAmount,
        "orderFpPoint": orderFpPoint,
        "orderFpInvoiceNumber": orderFpInvoiceNumber,
        "orderFpInvoiceDate": orderFpInvoiceDate,
        "orderFpInvoiceStatus": orderFpInvoiceStatus,
        "orderFpPaymentType": orderFpPaymentType,
        "orderFpPaymentTypeDetail": orderFpPaymentTypeDetail,
        "orderFpPaymentAccountDetail": orderFpPaymentAccountDetail,
      };
}

class ProductTravelerBuyDetail {
  ProductTravelerBuyDetail({
    this.travelerName,
    this.travelerBirthDate,
    this.travelerIdentityNumber,
  });

  String? travelerName;
  DateTime? travelerBirthDate;
  String? travelerIdentityNumber;

  factory ProductTravelerBuyDetail.fromJson(Map<String, dynamic> json) =>
      ProductTravelerBuyDetail(
        travelerName: json["travelerName"],
        travelerBirthDate: json["travelerBirthDate"] == null
            ? null
            : DateTime.parse(json["travelerBirthDate"]),
        travelerIdentityNumber: json["travelerIdentityNumber"],
      );

  Map<String, dynamic> toJson() => {
        "travelerName": travelerName,
        "travelerBirthDate":
            "${travelerBirthDate?.year.toString().padLeft(4, '0')}-${travelerBirthDate?.month.toString().padLeft(2, '0')}-${travelerBirthDate?.day.toString().padLeft(2, '0')}",
        "travelerIdentityNumber": travelerIdentityNumber,
      };
}
