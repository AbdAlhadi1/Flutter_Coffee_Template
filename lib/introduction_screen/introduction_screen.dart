import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Home page /home_page.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
              titleWidget: Column(
                children: const [
                  SizedBox(height: 50,),
                  Text(
                    "Easy Way To Get Your Daily Fraech Coffee",
                    style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
              bodyWidget: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    Stack(
                      children: const [
                        Image(
                          image: AssetImage("images/3.png"),
                          fit: BoxFit.fill,
                          width: 450,
                          height: 500,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          PageViewModel(
              titleWidget: Column(
                children: const [
                  SizedBox(height: 50,),
                  Text(
                    "Fraech And High Quality Ingredients",
                    style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
              bodyWidget: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 0,),
                    Stack(
                      children: const [
                        Image(
                          image: AssetImage("images/intro2.jpeg"),
                          fit: BoxFit.fill,

                        ),
                      ],
                    ),
                  ],
                ),
              )),
          PageViewModel(
              titleWidget: Column(
                children: const [
                  SizedBox(height: 50,),
                  Text(
                    "Get Start And Test High Quality Coffee",
                    style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
              bodyWidget: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 25,),
                    Stack(
                      children: const [
                        Image(
                          image: AssetImage("images/intro3.jpeg"),
                          fit: BoxFit.fill,

                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
        done: const Text("Done",
            style: TextStyle(
              fontSize: 20,
            )),
        onDone: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        },
        skip: const Text("Skip",
            style: TextStyle(
              fontSize: 20,
            )),
        onSkip: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        },
        next: const Icon(
          Icons.arrow_forward,
          size: 35,
        ),
        showSkipButton: true,
        showNextButton: true,
      ),
    );
  }
}
