import 'data.dart';

class ResponseDefault {
  int? count;
  Links? links;
  List<Data>? data;

  ResponseDefault({this.count, this.links, this.data});

  ResponseDefault.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? self;
  String? next;

  Links({this.self, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['next'] = next;
    return data;
  }
}

