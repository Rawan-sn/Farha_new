import 'dart:convert';

class ServiceHallDetails {
  int id;
  int serviceId;
  int djs;
  int weddingCar;
  int photography;
  String startTime;
  String endTime;
  String createAt;
  String updatedAt;
  dynamic deletedAt;

  List<HallDetails> hallDetails;
  List<Venues> venues;
  ServiceHallDetails({
     this.id,
     this.serviceId,
     this.djs,
     this.weddingCar,
     this.photography,
     this.startTime,
     this.endTime,
     this.createAt,
     this.updatedAt,
     this.deletedAt,
    this.hallDetails,
     this.venues,
  });
  


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'service_id': serviceId,
      'djs': djs,
      'wedding_car': weddingCar,
      'photography': photography,
      'start_time': startTime,
      'end_time': endTime,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'hallDetails': hallDetails?.map((x) => x.toMap())?.toList()??[],
      'venues': venues?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ServiceHallDetails.fromMap(Map<String, dynamic> map) {
    return ServiceHallDetails(
      id: map['id'],
      serviceId: map['service_id'],
      djs: map['djs'],
      weddingCar: map['wedding_car'],
      photography: map['photography'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
      hallDetails:List<HallDetails>.from(map['hallDetails']?.map((x) => HallDetails.fromMap(x))),

      venues: List<Venues>.from(map['venues']?.map((x) => Venues.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceHallDetails.fromJson(String source) => ServiceHallDetails.fromMap(json.decode(source));
}

class Venues {
  int id;
  int hallId;
  String name;
  int forMen;
  int forWomen;
  int forMix;
  int capacity;
  int price;
  String image;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  List<int> type;
  Venues({
    this.id,
    this.hallId,
    this.name,
    this.forMen,
    this.forWomen,
    this.forMix,
    this.capacity,
    this.price,
    this.image,
    this.createAt,
    this.updatedAt,
    this.deletedAt,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hall_id': hallId,
      'name': name,
      'for_men': forMen,
      'for_women': forWomen,
      'for_mix': forMix,
      'capacity': capacity,
      'price': price,
      'image': image,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'type': type,
    };
  }

  factory Venues.fromMap(Map<String, dynamic> map) {
    return Venues(
      id: map['id'],
      hallId: map['hallId'],
      name: map['name'],
      forMen: map['for_men'],
      forWomen: map['for_women'],
      forMix: map['for_mix'],
      capacity: map['capacity'],
      price: map['price'],
      image: map['image'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
      type: List<int>.from(map['type']?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Venues.fromJson(String source) => Venues.fromMap(json.decode(source));
}
class HallDetails {
  int id;
  int hallId;
  String name;
  String description;
  String createdAt;
  String updatesAt;
  dynamic deletedAt;
  HallDetails({
    this.id,
    this.hallId,
    this.name,
    this.description,
    this.createdAt,
    this.updatesAt,
    this.deletedAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hallId': hallId,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatesAt,
      'deleted_at': deletedAt,
    };
  }

  factory HallDetails.fromMap(Map<String, dynamic> map) {
    return HallDetails(
      id: map['id'],
      hallId: map['hallId'],
      name: map['name'],
      description: map['description'],
      createdAt: map['created_at'],
      updatesAt: map['updated_at'],
      deletedAt: map['deleted_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HallDetails.fromJson(String source) => HallDetails.fromMap(json.decode(source));
}
