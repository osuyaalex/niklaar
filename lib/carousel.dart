import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tesst/pick_country_page.dart';
import 'package:tesst/tools/sizes.dart';
class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key,});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _activeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> titles =[
      Stack(
        children: [
          Container(
            height: 100.pH,
            width: 100.pW,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF009EEA),
                  Color(0xFF1F3669),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/card 2 1.png'),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  10.gap,
                  SizedBox(
                    width: 90.pW,
                    child: Text('Borderless Payments, Instant Transfers',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.archivoBlack(
                      color: Colors.white,
                        fontWeight: FontWeight.w600,
                      fontSize: 30,
                        height: 1.0
                    ),
                    ),
                  ),
                  1.gap,
                  SizedBox(
                    width: 90.pW,
                      child: Text('Enjoy seamless money transfers and hassle-free transactions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                      )
                  )
                ],

              )
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            height: 100.pH,
            width: 100.pW,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF009EEA),
                  Color(0xFF1F3669),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/shop 1.png'),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  10.gap,
                  SizedBox(
                    width: 90.pW,
                    child: Text('Discover & Share the Best Deals',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivoBlack(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          height: 1.0
                      ),
                    ),
                  ),
                  1.gap,
                  SizedBox(
                      width: 90.pW,
                      child: Text('Explore amazing deals or share your own with the community',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  )
                ],

              )
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            height: 100.pH,
            width: 100.pW,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF009EEA),
                  Color(0xFF1F3669),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/discounts 1.png'),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  10.gap,
                  SizedBox(
                    width: 90.pW,
                    child: Text('Unlock Exclusive Discounts',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivoBlack(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          height: 1.0
                      ),
                    ),
                  ),
                  1.gap,
                  SizedBox(
                      width: 90.pW,
                      child: Text('Get more visibility and increase sales by listing on influencer pages on the discount market',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,

                        ),
                      )
                  )
                ],

              )
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            height: 100.pH,
            width: 100.pW,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF009EEA),
                  Color(0xFF1F3669),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/login 1.png'),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  10.gap,
                  SizedBox(
                    width: 90.pW,
                    child: Text('Build & Track Your Credit Score',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivoBlack(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          height: 1.0
                      ),
                    ),
                  ),
                  1.gap,
                  SizedBox(
                      width: 90.pW,
                      child: Text('Stay credible and trustworthy by shopping, reviewing, and engaging with deals.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  )
                ],

              )
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            height: 100.pH,
            width: 100.pW,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF009EEA),
                  Color(0xFF1F3669),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/login 1.png'),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  10.gap,
                  Image.asset('assets/full logo.png',width: 50.pW,height: 30.pW,),
                ],

              )
          ),
        ],
      ),
    ];
    Widget buildIndicator(){
      return AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        count: titles.length,
        effect:  WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: const  Color(0xFF1F3669),
            dotColor: const  Color(0xFF009EEA).withOpacity(0.2)
        ),
      );
    }
    return  Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 16/9,
                height: MediaQuery.of(context).size.height,
                autoPlay: false,
                initialPage: 0,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                onPageChanged: (index, reason){
                  setState(() {
                    _activeIndex = index;
                  });
                }
            ),
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return titles[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: _activeIndex != 4?Padding(
                padding:  EdgeInsets.only(bottom: 14.pH),
                child: buildIndicator(),
              ):SizedBox(
                height: 20.pH,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 90.pW,
                        height: 11.5.pW,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                             RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(9)
                             ) 
                            )
                          ),
                            onPressed:  (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return PickCountryPage();
                            }));
                            },
                            child: Center(
                              child: Text('Create an account',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            )
                        ),
                      ),
                      1.gap,
                      TextButton(
                          onPressed: (){},
                          child: Text('Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                          )
                      )
                    ],
                  )
              )
          )
        ],
      ),
    );
  }
}
