import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/screens/movie_detail.dart';

class MovieCard extends StatelessWidget {
   final List<int> wihsListIds;
  final void Function(int) onToggleWishList;
  final MovieModel data;
  const MovieCard(this.data, this.wihsListIds, this.onToggleWishList, {super.key});

  void _onTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetaiPage(data, wihsListIds, onToggleWishList)));
  } 

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3 - 20;
    return InkWell(
      onTap: () => _onTap(context),
      child: Column(
        children: [
          Container(
            height: width * 1.5,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: NetworkImage(data.imgUrl), fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 5,),
          SizedBox(
            width: width,
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7)
              ),
            )
          )
        ],
      ),
    );
  }
}