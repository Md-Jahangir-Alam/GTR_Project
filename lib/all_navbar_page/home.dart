import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:ubazar/utilis/style.dart';
import '../get_product/get_product.dart';
import '../utilis/colors.dart';
import '../utilis/images.dart';
import '../widgets/text_widget.dart';

class NavHome extends StatefulWidget {
  const NavHome({super.key});

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  final List<Image> images = [
    Image.asset(Images.slider_image),
    Image.asset(Images.slider_image),
  ];

  final List category = [
    "Fruits and Vegetables",
    "Grocery and Staples",
    "Household Needs",
    "Mans and Womens Wear",
    "Foot Wear"
  ];

  final List<Image> category_images = [
    Image.asset(Images.fruits_and_vegetables),
    Image.asset(Images.grocery),
    Image.asset(Images.household),
    Image.asset(Images.man_woman),
    Image.asset(Images.foot_ware),
  ];

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h / 5,
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                    controller: _sliderController,
                    slideBuilder: (index){
                    return Container(
                      alignment: Alignment.center,
                      child: images[index],
                    );
                    },
                    itemCount: images.length,
                  initialPage: 0,
                  enableAutoSlider: true,
                  scrollDirection: Axis.horizontal,
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                    padding: EdgeInsets.only(top: 15),
                    indicatorBorderColor: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
                  ),
                ),
              ),
              HWdistance.distence_height10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h / 7,
                    width: w / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Column(
                      children: [
                        Card(child: Image.asset(Images.all_product, scale: 3,)),
                        HWdistance.distence_height5,
                        Catagory_Text("All")
                      ],
                    ),
                  ),
                  Container(
                    height: h / 7,
                    width: w / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Column(
                      children: [
                        Card(child: Image.asset(Images.fruits, scale: 3,)),
                        HWdistance.distence_height5,
                        Catagory_Text("Fruits")
                      ],
                    ),
                  ),
                  Container(
                    height: h / 7,
                    width: w / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Column(
                      children: [
                        Card(child: Image.asset(Images.vegetables, scale: 3,)),
                        HWdistance.distence_height5,
                        Catagory_Text("Vegetables")
                      ],
                    ),
                  ),
                  Container(
                    height: h / 7,
                    width: w / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Column(
                      children: [
                        Card(child: Image.asset(Images.fish, scale: 3,)),
                        HWdistance.distence_height5,
                        Catagory_Text("Fish")
                      ],
                    ),
                  ),
                ],
              ),
              HWdistance.distence_height10,
              ListView.builder(
                shrinkWrap: true,
                itemCount: category.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>GetAllProduct(text: category[index],)));
                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: w / 6,
                                  child: category_images[index],
                                ),
                              ),
                              SizedBox(
                                width: w / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Catagory_Text_title(category[index]),
                                    HWdistance.distence_height2,
                                    Text("Lorem ipsum diord sit amit, sjjrk aosjet constectia adiposimg sot", maxLines: 2,),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w / 6,
                                child: Icon(Icons.chevron_right, size: 35, color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,),
                              ),
                              // ListTile(
                              //   trailing: Icon(Icons.chevron_right, size: 35,color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,),
                              //   leading: Image.asset(Images.fruits_and_vegetables),
                              //   title: Text(category[index]),
                              //   subtitle: Catagory_Text("fsjflsjfwfsjafodaifasdkjfso"),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
