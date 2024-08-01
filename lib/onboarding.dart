import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'datasourcestatic.dart';
import 'login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex= 0;
  PageController _controller=PageController();
  @override
  void initState(){
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Expanded(
              flex: 3,
              child: PageView.builder(
                  controller: _controller,
                  itemCount: onBoardingList.length,
                  onPageChanged: (int index){
                    setState(() {
                      currentIndex=index;
                    });
                  },

                  itemBuilder: (_ , i)=> Column(children: [
                    SizedBox(height: 40,),

                    Text(onBoardingList[i].title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black,fontFamily: 'Poppins'),),
                    SizedBox(height: 80,),
                    SvgPicture.asset(onBoardingList[i].image,height: 300,width: 250,),
                    SizedBox(height: 80,),
                     ],)),
            ),

            Expanded(flex: 1,
                child: Column(
                  children: [
                    SmoothPageIndicator(
                        effect:  WormEffect(
                            spacing:  8.0,
                            radius:  40.0,
                            dotWidth:  15.0,
                            dotHeight:  15.0,
                            paintStyle:  PaintingStyle.stroke,
                            strokeWidth:  1.5,
                            dotColor:  Colors.grey,
                            activeDotColor:  Color(0xffFD8700)
                        ),
                        controller: _controller,  // PageController
                        count:  onBoardingList.length,
                        onDotClicked: (index){

                        }
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(onPressed: (){
                          _controller.animateToPage(
                            onBoardingList.length - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }, child: Text('Skip',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black,fontFamily: 'Poppins'),)),
                        Container(
                          margin: EdgeInsets.only(bottom: 40),
                         // height: 50,

                          child: MaterialButton(
                            onPressed: (){
                            if(currentIndex==onBoardingList.length - 1 ){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>signup(),)
                              );
                            }
                            _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceIn);

                          },
                            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                            textColor: Colors.white,
                            child: Text("Next",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color(0xffFD8700), ),
                        ),
                      ],
                    ),

                  ],
                ))
          ],
        ),),);}}

