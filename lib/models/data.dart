import 'package:chuva_dart/common/util_api.dart';

import '../geral.dart';
import 'locations.dart';
import 'category.dart';
import 'people.dart';
import 'title.dart';
import "type.dart";

class Data {
      int? id;
      int? changed;
      DateTime? start;
      DateTime? end;
      Title? title;
      Title? description;
      Category? category;
      List<Locations>? locations;
      Type? type;
      List<String?>? papers;
      List<People>? people;
      int? status;
      int? weight;
      String? addons;
      int? parent;
      String? event;

      Data(
          {this.id,
                this.changed,
                this.start,
                this.end,
                this.title,
                this.description,
                this.category,
                this.locations,
                this.type,
                this.papers,
                this.people,
                this.status,
                this.weight,
                this.addons,
                this.parent,
                this.event});

      Data.fromJson(Map<String, dynamic> json) {
            id = json['id'];
            changed = json['changed'];
            start = Geral.getValorJson(json['start'],TpValor.dateTime);
            end = Geral.getValorJson(json['end'],TpValor.dateTime);
            title = json['title'] != null ? Title.fromJson(json['title']) : null;
            description = json['description'] != null
                ? Title.fromJson(json['description'])
                : null;
            category = json['category'] != null
                ? Category.fromJson(json['category'])
                : null;
            if (json['locations'] != null) {
                  locations = <Locations>[];
                  json['locations'].forEach((v) {
                        locations!.add(Locations.fromJson(v));
                  });
            }
            type = json['type'] != null ? Type.fromJson(json['type']) : null;
            if (json['papers'] != null) {
                  papers = <Null>[];
                  json['papers'].forEach((v) {
                        papers!.add(v);
                  });
            }
            if (json['people'] != null) {
                  people = <People>[];
                  json['people'].forEach((v) {
                        people!.add(People.fromJson(v));
                  });
            }
            status = json['status'];
            weight = json['weight'];
            addons = json['addons'];
            parent = json['parent'];
            event = json['event'];
      }

      Map<String, dynamic> toJson() {
            final Map<String, dynamic> data = <String, dynamic>{};
            data['id'] = id;
            data['changed'] = changed;
            data['start'] = start;
            data['end'] = end;
            if (title != null) {
                  data['title'] = title!.toJson();
            }
            if (description != null) {
                  data['description'] = description!.toJson();
            }
            if (category != null) {
                  data['category'] = category!.toJson();
            }
            if (locations != null) {
                  data['locations'] = locations!.map((v) => v.toJson()).toList();
            }
            if (type != null) {
                  data['type'] = type!.toJson();
            }
            if (papers != null) {
                  data['papers'] = papers!.map((v) => v).toList();
            }
            if (people != null) {
                  data['people'] = people!.map((v) => v.toJson()).toList();
            }
            data['status'] = status;
            data['weight'] = weight;
            data['addons'] = addons;
            data['parent'] = parent;
            data['event'] = event;
            return data;
      }
}