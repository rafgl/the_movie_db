// ignore_for_file: use_key_in_widget_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/bindings/movies_bindings.dart';
import 'package:the_movie_db/components/cached_network_image_widget.dart';
import 'package:the_movie_db/components/click_on_card_widget.dart';
import 'package:the_movie_db/controllers/dashboard_controller.dart';
import 'package:the_movie_db/models/args/moviesArgs.dart';
import 'package:the_movie_db/services/storage.dart';
import 'package:the_movie_db/utils/colors.dart';
import 'package:the_movie_db/utils/routes.dart';

import 'movies_details.dart';

class DashBoardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blueDB,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.exit_to_app,
                          color: Colors.white, size: 35),
                      onPressed: () async {
                        await StorageService.box.remove('user');
                        Get.toNamed(Routes.login);
                      },
                    ),
                    Image.asset(
                      "assets/img/logo.jpeg",
                      width: 52.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Bem-vindo a listagem de filmes:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 45, top: 40),
                          child: Row(
                            children: [
                              Icon(Icons.ondemand_video_outlined,
                                  color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 35, bottom: 0),
                                child: Text(
                                  'Filmes do momento:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Container(
                            margin: EdgeInsets.only(top: 24, bottom: 15),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 180,
                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                              ),
                              items: _carouselRecentMovies(),
                            ),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 45, top: 40),
                          child: Row(
                            children: [
                              Icon(Icons.ondemand_video_outlined,
                                  color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 35, bottom: 0),
                                child: Text(
                                  'Filmes populares:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Container(
                            margin: EdgeInsets.only(top: 24, bottom: 15),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 180,
                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                              ),
                              items: _carouselPopularMovies(),
                            ),
                          );
                        })
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _carouselRecentMovies() {
    return controller.movieRecent
        .map((item) => Container(
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImageWidget(
                          image:
                              'https://image.tmdb.org/t/p/original${item.backdropPath}',
                          width: 1000,
                          height: 300,
                          cover: true,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '${item.originalTitle}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ClickOnCardWidget(
                          height: 300,
                          width: 1000,
                          isLink: true,
                          route: () => Get.to(
                            MoviesDetails(),
                            binding: MoviesDetailsBinding(),
                            arguments: MovieArgs(
                              movie: item,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }

  _carouselPopularMovies() {
    return controller.moviePopular
        .map((item) => Container(
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImageWidget(
                          image:
                              'https://image.tmdb.org/t/p/original${item.backdropPath}',
                          width: 1000,
                          height: 300,
                          cover: true,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '${item.originalTitle}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ClickOnCardWidget(
                          height: 300,
                          width: 1000,
                          isLink: true,
                          route: () => Get.to(
                            MoviesDetails(),
                            binding: MoviesDetailsBinding(),
                            arguments: MovieArgs(
                              movie: item,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
  }
}
