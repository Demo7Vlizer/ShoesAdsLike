import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneaker_shop/FadeAnimation.dart';
import 'package:sneaker_shop/shoes.dart';
import 'package:sneaker_shop/utils/image_cache_manager.dart';
import 'package:sneaker_shop/shared/widgets/shoe_card_skeleton.dart';
import 'package:sneaker_shop/utils/custom_page_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ImageCacheManager().configureImageCache();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ImageCacheManager().preloadImages(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title:
            Text("Shoes", style: TextStyle(color: Colors.black, fontSize: 25)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "All",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.1,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Sneakers",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.2,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Football",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Soccer",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: FadeAnimation(
                          1.4,
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                "Golf",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                  1.5,
                  makeItem(
                      image: 'assets/images/one.jpg',
                      tag: 'red',
                      context: context)),
              FadeAnimation(
                  1.6,
                  makeItem(
                      image: 'assets/images/two.jpg',
                      tag: 'blue',
                      context: context)),
              FadeAnimation(
                  1.7,
                  makeItem(
                      image: 'assets/images/three.jpg',
                      tag: 'white',
                      context: context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem(
      {required String image,
      required String tag,
      required BuildContext context}) {
    return FutureBuilder(
      future: precacheImage(AssetImage(image), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return ShoeCardSkeleton();
        }

        return Hero(
          tag: tag,
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
              ),
            );
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(
                  child: Shoes(
                    image: image,
                    tag: tag,
                  ),
                ),
              );
            },
            child: Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400]!,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                  "Sneakers",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                                1.1,
                                Text(
                                  "Nike",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          ],
                        ),
                      ),
                      FadeAnimation(
                          1.2,
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                size: 20,
                              ),
                            ),
                          ))
                    ],
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "100\$",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
