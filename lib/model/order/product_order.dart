import 'package:json_annotation/json_annotation.dart';
part 'product_order.g.dart';

@JsonSerializable()
class ProductOrder {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "phone")
  String? phone;

  // @JsonKey(name: "image")
  // String? image;

  @JsonKey(name: "price")
  double? price;

  // @JsonKey(name: "brand")
  // String? brand;

  // @JsonKey(name: "offer")
  // bool? offer;

  ProductOrder({
    this.id,
    this.name,
    this.address,
    this.phone,
    // this.image,
    // this.offer,
    this.price,
    // this.brand,
  });

  factory ProductOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOrderToJson(this);
}
