import 'package:flutter/material.dart';
import 'package:ubazar/utilis/colors.dart';
import 'package:ubazar/utilis/style.dart';
import '../all_navbar_page/Profile.dart';
import '../all_navbar_page/cart.dart';
import '../all_navbar_page/favorite.dart';
import '../all_navbar_page/home.dart';
import '../drawer_page/drawer_page.dart';
import '../utilis/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentindex = 0;
  final pages = [NavHome(), CartPage(), Favorite(), Profile()];
  final GlobalKey<ScaffoldState> _drawer = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _drawer,
      drawer: Drawer(
        child: DrawerPage(),
      ),
      appBar: AppBar(
        title: SizedBox(
            height: h / 3,
            width: w / 4,
            child: Image.asset(Images.open_screen)),
        centerTitle: true,
        elevation: 0,
        backgroundColor:
            ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
        leading: IconButton(
            onPressed: () {
              _drawer.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 25,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 25,
                ),
                HWdistance.distence_width5,
                Icon(
                  Icons.local_grocery_store_outlined,
                  size: 25,
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
            ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
        unselectedItemColor: ColorsCode.skip_welcomepagetext_prodetails,
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: ColorsCode.pageback_appbar_icon_color,
              icon: Icon(
                Icons.home_outlined,
                size: 35,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: ColorsCode.pageback_appbar_icon_color,
              icon: Icon(
                Icons.local_grocery_store_outlined,
                size: 35,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              backgroundColor: ColorsCode.pageback_appbar_icon_color,
              icon: Icon(
                Icons.favorite_border,
                size: 35,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
            backgroundColor: ColorsCode.pageback_appbar_icon_color,
            icon: Icon(
              Icons.account_circle_outlined,
              size: 35,
            ),
            label: "Me",
          ),
        ],
      ),
      body: pages[_currentindex],
    );
  }
}
