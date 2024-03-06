// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrder _$ProductOrderFromJson(Map<String, dynamic> json) => ProductOrder(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductOrderToJson(ProductOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
