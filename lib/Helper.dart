import 'dart:convert';

import 'package:flutter/material.dart';


/// Create promise to load messages from json file
Future<Map<String, dynamic>> loadJsonFileAsMap (BuildContext context, String assetPath) async {
  // Get the content of an asset as string
  String messageDetailsString = await DefaultAssetBundle.of(context)
      .loadString(assetPath);

  // Map content as JSON
  Map<String, dynamic> mappedMessages = json.decode(messageDetailsString);
  return mappedMessages;
}
