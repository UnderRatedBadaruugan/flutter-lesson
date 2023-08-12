import 'package:flutter/material.dart';
import 'package:movie/screens/movies.dart';
import 'package:movie/screens/profile.dart';
import 'package:movie/screens/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> _wishListIds = [];
  int _currentIndex = 2;
  late List<Widget> _totalPage;

  @override
  void initState() {
    super.initState();
    _totalPage = [MoviesPage(_wishListIds, _toggleWishList), WishListPage(_wishListIds, _toggleWishList), ProfilePage()];
  }

  void setCurrentIndex(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  void _toggleWishList(int idx) {
    setState(() {
      if (_wishListIds.contains(idx)) {
      _wishListIds.remove(idx);
      } else {
        _wishListIds.add(idx);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2E3239),
      body: SafeArea(
        child: _totalPage[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: setCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Кино"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Дуртай"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профайл"
          ),
        ], 
      ),
    );
  }
}