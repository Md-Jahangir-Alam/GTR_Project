import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ubazar/utilis/style.dart';
import '../home_page/home_page.dart';
import '../utilis/colors.dart';
import '../utilis/images.dart';
import '../widgets/text_widget.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsCode.pageback_appbar_icon_color,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: ColorsCode.pageback_appbar_icon_color,
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: "",
                bodyWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text("Welcome to"),
                    Row(
                      children: [
                        SizedBox(
                            height: h / 20,
                            width: w / 4,
                            child: Image.asset(Images.welcome_page_text)),
                        Custom_Text(" Aplication"),
                      ],
                    ),
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    Center(
                      child: Image.asset(Images.welcome_page_1),
                    )
                  ],
                ),
              ),
              PageViewModel(
                title: "",
                bodyWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Custom_Text("Get"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Fast",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
                              fontFamily: "Roboto"),
                        ),
                        Custom_Text(" Delivery Service"),
                      ],
                    ),
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    Center(
                      child: Image.asset(Images.welcome_page_2),
                    )
                  ],
                ),
              ),
              PageViewModel(
                title: "",
                bodyWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Custom_Text("Best Quality"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Grocery",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
                              fontFamily: "Roboto"),
                        ),
                        Custom_Text(" Door to Door"),
                      ],
                    ),
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    HWdistance.distence_height20,
                    Center(
                      child: Image.asset(Images.welcome_page_3),
                    )
                  ],
                ),
              ),
            ],
            done: Text("Done", style: TextStyle(color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav)),
            showSkipButton: true,
            skip: Text("Skip", style: TextStyle(color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav),),
            showNextButton: true,
            next: Text("Next", style: TextStyle(color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav)),
            dotsDecorator: DotsDecorator(
              size: Size(10.0, 10.0),
              color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22.0))
              )
            ),
            onDone: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
          ),
        ),
      ),
    );
  }
}
