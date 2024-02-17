import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


Future<DateTime?> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // Replace with the initial date if any
    firstDate: DateTime(2000), // Adjust the start range of the calendar
    lastDate: DateTime(2101), // Adjust the end range of the calendar
  );
  return picked;
}

Future<DateTime?> selectDateTime(BuildContext context) async {
  // Show the date picker first.
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  // If the date picker is canceled, return null.
  if (pickedDate == null) return null;

  // Show the time picker next.
  // ignore: use_build_context_synchronously
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  // If the time picker is canceled, do not proceed and return null.
  if (pickedTime == null) return null;

  // Combine the date and time into a single DateTime object and return.
  return DateTime(
    pickedDate.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime.hour,
    pickedTime.minute,
  );
}


Future<XFile> assetToXFile(String assetPath) async {
  final byteData = await rootBundle.load(assetPath);
  final buffer = byteData.buffer;
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  String fileName = assetPath.split('/').last; // Extract the file name
  File file = File('$tempPath/$fileName');
  await file.writeAsBytes(
      buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  return XFile(file.path);
}