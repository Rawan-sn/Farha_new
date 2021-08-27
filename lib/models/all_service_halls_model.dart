import 'dart:convert';

import 'package:farha_app/models/link_model.dart';
import 'package:farha_app/models/list_services_halls_model.dart';

import 'list_service_beauty_center_model.dart';

class ServiceHallsModel {
  int currentPage;
  List<ListServiceHallsModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<LinksModel> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  ServiceHallsModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentPage,
      'data': data?.map((x) => x.toMap())?.toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links?.map((x) => x.toMap())?.toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }

  factory ServiceHallsModel.fromMap(Map<String, dynamic> map) {
    return ServiceHallsModel(
      currentPage: map['current_page'],
      data: List<ListServiceHallsModel>.from(
          map['data']?.map((x) => ListServiceHallsModel.fromMap(x))),
      firstPageUrl: map['first_page_url'],
      from: map['from'],
      lastPage: map['last_page'],
      lastPageUrl: map['last_page_url'],
      links: List<LinksModel>.from(
          map['links']?.map((x) => LinksModel.fromMap(x))),
      nextPageUrl: map['next_page_url'],
      path: map['path'],
      perPage: map['per_page'],
      prevPageUrl: map['prev_page_url'],
      to: map['to'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceHallsModel.fromJson(String source) =>
      ServiceHallsModel.fromMap(json.decode(source));
}
