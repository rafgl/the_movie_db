// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:the_movie_db/components/cached_network_image_widget.dart';
import 'package:the_movie_db/controllers/movies/movies_detail_controller.dart';
import 'package:the_movie_db/utils/colors.dart';

class MoviesDetails extends GetView<MoviesDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      body: _buildContent(),
    );
  }

  _buildContent() {
    return Builder(
      builder: (context) => SliverFab(
        floatingWidget: Container(
          width: 110,
          height: 180,
          child: Card(
            color: Color(0xffF7F7F7),
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: CachedNetworkImageWidget(
              image:
                  'https://image.tmdb.org/t/p/original${controller.movie.posterPath}',
              width: 100,
              height: 180,
              cover: true,
            ),
          ),
        ),
        floatingPosition: FloatingPosition(right: 24),
        expandedHeight: 210.0,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 300.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: CachedNetworkImageWidget(
                    image:
                        'https://image.tmdb.org/t/p/original${controller.movie.backdropPath}',
                    cover: true,
                    width: 300,
                    height: 300,
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 20,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Color(0xff333333),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      border: Border.all(
                        color: Color(0xff333333),
                        width: 0,
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(child: _buildCupomList()),
          ),
        ],
      ),
    );
  }

  _buildCupomList() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20, left: 35, bottom: 20, right: 130),
            child: Text(
              controller.movie.title.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          !controller.loading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 35, bottom: 0),
                      child: Text(
                        'Avaliação dos usuários:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 35, bottom: 20),
                      child: Text(
                        controller.movieData.voteAverage.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 35, bottom: 0),
                      child: Text(
                        'Gêneros:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          controller.movieData.genres!.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 35, bottom: 0),
                            child: Text(
                              controller.movieData.genres![index].name
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 35, bottom: 0),
                      child: Text(
                        'Sinopse:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 35, bottom: 20, right: 35),
                      child: Text(
                        controller.movieData.overview.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator(color: MyColors.blueDB))
        ],
      );
    });
  }
}
