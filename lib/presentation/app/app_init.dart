import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:task_n1/infrasturucture/services/local_database.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    EasyLoading.init();
    await LocalDb.initialize();
  }
}
