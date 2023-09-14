import 'package:flutter/material.dart';

class ProductResp {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  ProductRating? rating;
  List<Color>? colors;

  ProductResp(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.colors});

  ProductResp.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      title = json['title'];
      price = json['price'] + .0;
      description = json['description'];
      category = json['category'];
      image = json['image'];
      rating = json['rating'] != null
          ? new ProductRating.fromJson(json['rating'])
          : null;
      colors = [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white
      ];
    } catch (e) {
      print("LOG_ProductResp_fromJson: exception = " + e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class ProductRating {
  double? rate;
  int? count;

  ProductRating({this.rate, this.count});

  ProductRating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] + .0;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
