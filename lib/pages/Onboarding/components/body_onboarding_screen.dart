import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/components/Colors.dart';
import 'package:ulivery_mobile_app/pages/Login&Register/pages/login_startpage.dart';
import '../../Login&Register/widgets/RoundedButton.dart';
import 'onboarding_container.dart';

class Body_Onboarding_Screen extends StatefulWidget {
  const Body_Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Body_Onboarding_Screen> createState() => _Body_Onboarding_ScreenState();
}

class _Body_Onboarding_ScreenState extends State<Body_Onboarding_Screen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  List<Map<String, dynamic>> onboardingdata = [
    {
      "titletext": "Lorem ipsum dolor sit amet, consectetur.",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisi.",
      "image": "assets/OnboardingScreen/Onboarding1.png"
    },
    {
      "titletext": "Lorem ipsum dolor sit amet, consectetur.",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisi.",
      "image": "assets/OnboardingScreen/Onboarding2.png"
    },
    {
      "titletext": "Lorem ipsum dolor sit amet, consectetur.",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisi.",
      "image": "assets/OnboardingScreen/Onboarding2.png"
    },
    {
      "titletext": "Lorem ipsum dolor sit amet, consectetur.",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisi.",
      "image": "assets/OnboardingScreen/Onboarding2.png"
    }


  ];
  @override
  Widget build(BuildContext context) {

    double screenWidth =
        MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height;
    return SafeArea(
      child: SizedBox(
        width: screenWidth,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingdata.length,
                  itemBuilder: (context, index) => OnboardingContainer(
                  titletext: onboardingdata[index]["titletext"],
                  text: onboardingdata[index]["text"],
                  image: onboardingdata[index]["image"],
                ),
                )
        )
            ,
            Expanded(
              flex:1,
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          onboardingdata.length,
                              (index) => buildDot(index: index)),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildSkipButton(context),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        buildNextButton(context)
                      ],

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildNextButton(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      child: RoundedButton(
                          text: currentPage == onboardingdata.length - 1 ? "Start" : "Volgende",
                          press: () {
                            currentPage == onboardingdata.length - 1 ?
                            Navigator.push(context,
                            MaterialPageRoute(builder:
                            (context){
                            return StartPage();
                            },
                            ),
                            )
                            :
                            _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
                          },
                          color: colorprimary,
                          textColor: Colors.white,
                          width: currentPage == onboardingdata.length - 1 ? 0.9: 0.45,
                        ),
    );
  }

  AnimatedContainer buildSkipButton(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Visibility(
        visible: currentPage == onboardingdata.length - 1 ? false : true,
        child: RoundedButton(
                          text: "Overslaan",
                          press: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context){
                                return StartPage();
                              },
                              ),
                            );
                          },
                          color: colorprimarylight,
                          textColor: colorprimary,
                          width: 0.45,


                        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
                    margin: EdgeInsets.only(right: 5),
                    height: 6,
                      width: currentPage == index ? 20 : 6,
                      decoration: BoxDecoration(
                        color: currentPage == index ? colorprimary : colorprimarylight,
                        borderRadius: BorderRadius.circular(3),
                      ), duration: Duration(milliseconds: 200),
                  );
  }
}

