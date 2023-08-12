import 'package:flutter/material.dart';
import '../model/movie/index.dart';

class MovieDetaiPage extends StatefulWidget {
   final List<int> wihsListIds;
  final void Function(int) onToggleWishList;
  final MovieModel data;
  const MovieDetaiPage(this.data, this.wihsListIds, this.onToggleWishList, {super.key});

  @override
  State<MovieDetaiPage> createState() => _MovieDetaiPageState();
}

class _MovieDetaiPageState extends State<MovieDetaiPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 31, 35),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  width: width,
                  height: width * 1.5,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        widget.data.imgUrl,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.play_circle,
                              color: Colors.grey.withOpacity(0.5),
                              size: 60,
                            ),
                            SizedBox(height: 50,),
                            Text(
                              widget.data.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "${widget.data.publishedYear} | ${widget.data.durationMin} | ${widget.data.type}",
                              style: TextStyle(
                                color: Color(0xff777777),
                                fontSize: 14
                              ),
                            ),
                            SizedBox(height: 70,)
                          ],
                        ),
                      ),
                      SafeArea(
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context), 
                            icon: Icon(
                              Icons.chevron_left,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.onToggleWishList(widget.data.id);
                              });
                            }, 
                            icon: widget.wihsListIds.contains(widget.data.id) ? Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.red,
                            ) : Icon(
                              Icons.favorite_border,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      "Тайлбар",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      widget.data.description ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30,),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}