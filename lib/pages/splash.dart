// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:the_movie_db/controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xff032540),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.jpeg',
              width: 200,
            ),
            const SizedBox(height: 10),
            Image.asset(cupertinoActivityIndicatorSmall, width: 150),
          ],
        ),
      ),
    );
  }
}
