import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ulivery_mobile_app/pages/login/start.dart';
import 'package:ulivery_mobile_app/widgets/rounded_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString("assets/onboarding.json"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            List<Map<String, String>> content = [];
            for (var json in jsonDecode(snapshot.data!)) {
              content.add(Map<String, dynamic>.from(json).map((key, value) => MapEntry(key, value.toString())));
            }
            return OnBoardingScreenBody(content);
          }

          return Container();
        },
      ),
    );
  }
}

class OnBoardingScreenBody extends StatefulWidget {
  final List<Map<String, String>> content;

  const OnBoardingScreenBody(this.content, {Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                      _currentPage = value;
                    });
                  },
                  itemCount: widget.content.length,
                  itemBuilder: (context, index) => OnBoardingContainer(
                    title: widget.content[index]["title"]!,
                    text: widget.content[index]["text"]!,
                    image: widget.content[index]["image"]!,
                  ),
                )),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(widget.content.length, (index) => buildDot(index: index)),
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
      duration: const Duration(milliseconds: 1000),
      child: RoundedButton(
        text: _currentPage == widget.content.length - 1 ? "Start" : "Volgende",
        press: () {
          _currentPage == widget.content.length - 1
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginStartPage();
                    },
                  ),
                )
              : _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
        },
        color: Theme.of(context).colorScheme.primary,
        textColor: Colors.white,
        width: _currentPage == widget.content.length - 1 ? 0.9 : 0.45,
      ),
    );
  }

  AnimatedContainer buildSkipButton(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Visibility(
        visible: _currentPage == widget.content.length - 1 ? false : true,
        child: RoundedButton(
          text: "Overslaan",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginStartPage();
                },
              ),
            );
          },
          color: Theme.of(context).colorScheme.secondary,
          textColor: Theme.of(context).colorScheme.primary,
          width: 0.45,
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(3),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}

class OnBoardingContainer extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const OnBoardingContainer({required this.title, required this.text, required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Container(
          width: screenWidth,
          height: screenHeight * 0.5,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image))),
        ),
        SizedBox(
          height: screenHeight * 0.06,
        ),
        SizedBox(
          width: screenWidth * 0.8,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        SizedBox(
          width: screenWidth * 0.8,
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.primary),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
