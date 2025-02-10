// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sneaker_shop/FadeAnimation.dart';
import 'package:sneaker_shop/animations/slide_animation.dart';

class Shoes extends StatefulWidget {
  final String image;
  final String tag;

  const Shoes({
    super.key,
    required this.image,
    required this.tag,
  });

  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.tag,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium,
                    isAntiAlias: true),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
            child: Stack(
              children: <Widget>[
                FadeAnimation(
                  0.3,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SlideAnimation(
                          0.4,
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          slideUp: false,
                        ),
                        SlideAnimation(
                          0.4,
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                )
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.0),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SlideAnimation(
                          0.6,
                          Text(
                            "Sneakers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        SlideAnimation(
                          0.7,
                          Text(
                            "Size",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SlideAnimation(
                              0.8,
                              Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(right: 20),
                                child: Center(
                                    child: Text(
                                  '40',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            SlideAnimation(
                              0.85,
                              Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  '42',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            SlideAnimation(
                              0.86,
                              Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(right: 20),
                                child: Center(
                                    child: Text(
                                  '44',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            SlideAnimation(
                              0.87,
                              Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(right: 20),
                                child: Center(
                                    child: Text(
                                  '46',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        SlideAnimation(
                          0.9,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              'Buy Now',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
