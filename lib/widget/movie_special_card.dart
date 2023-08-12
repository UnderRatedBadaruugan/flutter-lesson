import 'package:flutter/material.dart';
import 'package:movie/screens/movie_detail.dart';
import '../model/movie/index.dart';

class MovieSpecialCard extends StatelessWidget {
  final List<int> wihsListIds;
  final void Function(int) onToggleWishList;
  final MovieModel data;
  const MovieSpecialCard(this.data, this.wihsListIds, this.onToggleWishList, {super.key});

  void _onTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetaiPage(data, wihsListIds, onToggleWishList)));
  } 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        height: width * 1.5,
        width: width,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: NetworkImage(data.imgUrl), fit: BoxFit.fill),
        ),
        child: Icon(
          Icons.play_circle,
          color: Colors.grey.withOpacity(0.6),
          size: 50,
        ),
      ),
    );
  }
}