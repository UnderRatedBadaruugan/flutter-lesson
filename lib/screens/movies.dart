import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/widget/movie_card.dart';
import 'package:movie/widget/movie_special_card.dart';
import '../model/movie/index.dart';

class MoviesPage extends StatefulWidget {
  final List<int> wihsListIds;
  final void Function(int) onToggleWishList;
  const MoviesPage(this.wihsListIds, this.onToggleWishList, {super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getData() async {
    String res = await DefaultAssetBundle.of(context).loadString("assets/movies.json");

    return MovieModel.fromList(jsonDecode(res));
  }  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _getData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final _specialData = snapshot.data!.length > 3 ? snapshot.data!.sublist(0, 3) : snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Шилдэг",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_specialData.length,
                      ((index) => MovieSpecialCard(_specialData[index], widget.wihsListIds, widget.onToggleWishList))
                    ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Бүх кинонууд",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(snapshot.data!.length, (index) => MovieCard(snapshot.data![index], widget.wihsListIds, widget.onToggleWishList)
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        );
        } else {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}
