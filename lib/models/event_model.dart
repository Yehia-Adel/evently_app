import 'package:flutter/material.dart';

class EventDataModel {
  static String collectionName = "EventDataCollection";
  String eventID;
  final String eventTitle;
  final String eventDescription;
  final String eventCategory;
  final String eventImage;
  final DateTime eventDate;
  final TimeOfDay eventTime;
  final bool isFavorite;

  EventDataModel({
    this.eventID = "",
    required this.eventTitle,
    required this.eventDescription,
    required this.eventCategory,
    required this.eventImage,
    required this.eventDate,
    required this.eventTime,
    this.isFavorite = false,
  });

  factory EventDataModel.fromFireStore(Map<String, dynamic> jason) =>
      EventDataModel(
          eventID: jason["eventID"],
          eventTitle: jason["eventTitle"],
          eventDescription: jason["eventDescription"],
          eventCategory: jason["eventCategory"],
          eventImage: jason["eventImage"],
          eventDate: jason["eventDate"],
          eventTime: jason["eventTime"],
          isFavorite: jason["isFavorite"]);

  Map<String, dynamic> toFireStore() {
    return {
      "eventId": eventID,
      "eventTitle": eventTitle,
      "eventDescription": eventDescription,
      "eventCategory": eventCategory,
      "eventImage": eventImage,
      "eventDate": eventDate,
      "eventTime": eventTime,
      "isFavorite": isFavorite,
    };
  }
}
