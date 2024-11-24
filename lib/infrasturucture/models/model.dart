import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../extention/extention.dart';

class ShopResponse {
  final List<Shop> data;
  final Links links;
  final Meta meta;

  ShopResponse({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory ShopResponse.fromJson(Map<String, dynamic> json) {
    return ShopResponse(
      data: List<Shop>.from(json['data'].map((x) => Shop.fromJson(x))),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Shop {
  final int id;
  final String slug;
  final String uuid;
  final bool open;
  final bool visibility;
  final bool verify;
  final int deliveryType;
  final String backgroundImg;
  final String logoImg;
  final String status;
  final DeliveryTime deliveryTime;
  final Point latLong;
  final int? rCount;
  final double? rAvg;
  final int minPrice;
  final int maxPrice;
  final int serviceMaxPrice;
  final double distance;
  final int productsCount;
  final Translation translation;
  final List<Service> services;
  final List<ShopWorkingDay> shopWorkingDays;
  final List<dynamic> shopClosedDate;

  Shop({
    required this.id,
    required this.slug,
    required this.uuid,
    required this.open,
    required this.visibility,
    required this.verify,
    required this.deliveryType,
    required this.backgroundImg,
    required this.logoImg,
    required this.status,
    required this.deliveryTime,
    required this.latLong,
    required this.rCount,
    required this.rAvg,
    required this.minPrice,
    required this.maxPrice,
    required this.serviceMaxPrice,
    required this.distance,
    required this.productsCount,
    required this.translation,
    required this.services,
    required this.shopWorkingDays,
    required this.shopClosedDate,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      slug: json['slug'],
      uuid: json['uuid'],
      open: json['open'],
      visibility: json['visibility'],
      verify: json['verify'],
      deliveryType: json['delivery_type'],
      backgroundImg: json['background_img'],
      logoImg: json['logo_img'],
      status: json['status'],
      deliveryTime: DeliveryTime.fromJson(json['delivery_time']),
      latLong: LatlngExt.fromMap(json['lat_long']),
      rCount: json['r_count'],
      rAvg: json['r_avg']?.toDouble(),
      minPrice: json['min_price'],
      maxPrice: json['max_price'],
      serviceMaxPrice: json['service_max_price'],
      distance: json['distance'].toDouble(),
      productsCount: json['products_count'],
      translation: Translation.fromJson(json['translation']),
      services:
          List<Service>.from(json['services'].map((x) => Service.fromJson(x))),
      shopWorkingDays: List<ShopWorkingDay>.from(
          json['shop_working_days'].map((x) => ShopWorkingDay.fromJson(x))),
      shopClosedDate: List<dynamic>.from(json['shop_closed_date']),
    );
  }
}

// 41, 69

class DeliveryTime {
  final String to;
  final String from;
  final String type;

  DeliveryTime({
    required this.to,
    required this.from,
    required this.type,
  });

  factory DeliveryTime.fromJson(Map<String, dynamic> json) {
    return DeliveryTime(
      to: json['to'],
      from: json['from'],
      type: json['type'],
    );
  }
}

class Translation {
  final int id;
  final String locale;
  final String title;
  final String description;
  final String address;

  Translation({
    required this.id,
    required this.locale,
    required this.title,
    required this.description,
    required this.address,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      locale: json['locale'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
    );
  }
}

class Service {
  Service();

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service();
  }
}

class ShopWorkingDay {
  final int id;
  final String day;
  final String from;
  final String to;
  final bool disabled;
  final String createdAt;
  final String updatedAt;

  ShopWorkingDay({
    required this.id,
    required this.day,
    required this.from,
    required this.to,
    required this.disabled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShopWorkingDay.fromJson(Map<String, dynamic> json) {
    return ShopWorkingDay(
      id: json['id'],
      day: json['day'],
      from: json['from'],
      to: json['to'],
      disabled: json['disabled'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Links {
  final String first;
  final String last;
  final String? prev;
  final String? next;

  Links({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  final int currentPage;
  final int? from;
  final int lastPage;
  final int perPage;
  final int? to;
  final int total;
  final List<MetaLink> links;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.to,
    required this.total,
    required this.links,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
      links:
          List<MetaLink>.from(json['links'].map((x) => MetaLink.fromJson(x))),
    );
  }
}

class MetaLink {
  final String? url;
  final String label;
  final bool active;

  MetaLink({
    this.url,
    required this.label,
    required this.active,
  });

  factory MetaLink.fromJson(Map<String, dynamic> json) {
    return MetaLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
