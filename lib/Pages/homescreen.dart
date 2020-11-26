import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_homescreen/customIcons/my_icons_icons.dart';
import 'package:food_homescreen/models/categories.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _search = TextEditingController();
  PageController _pageController;
  int pageIndex = 0;
  int cartCounter = 1;

  var categoryList = [
    Categories(imageUrl: "assets/images/snacks1.jpg", title: "Snacks"),
    Categories(imageUrl: "assets/images/farsan1.png", title: "Farsan"),
    Categories(imageUrl: "assets/images/sweets1.jpg", title: "Sweets"),
    Categories(imageUrl: "assets/images/fruits1.jpeg", title: "Dry Fruits"),
    Categories(imageUrl: "assets/images/chocolates1.jpg", title: "Chocolates"),
    Categories(imageUrl: "assets/images/shakes1.jpg", title: "Milkshakes"),
  ];

  categoriesList() {
    return Container(
      height: 110,
      child: Column(
        children: [
          Divider(
            thickness: 0.5,
          ),
          Container(
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                          categoryList[index].imageUrl,
                          height: 40,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(categoryList[index].title),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            thickness: 0.5,
          ),
        ],
      ),
    );
  }

  homePageHeader() {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
      child: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 5,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setSp(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    MyIcons.dots,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: ScreenUtil().setSp(15),
                  ),
                  Icon(
                    MyIcons.location,
                    color: Colors.grey[800],
                  )
                ],
              ),
              Stack(
                children: [
                  Icon(
                    MyIcons.shopping_cart,
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.deepOrange,
                      child: Text(
                        (cartCounter).toString(),
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  searchBar() {
    return Container(
      height: ScreenUtil().setSp(50),
      child: TextFormField(
        style: GoogleFonts.ptSansNarrow(
          color: Colors.grey,
          fontSize: ScreenUtil().setSp(17),
        ),
        controller: _search,
        decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.03, color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(35.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            hintText: "What are you looking for?",
            hintStyle: TextStyle(color: Colors.grey),
            alignLabelWithHint: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: ScreenUtil().setSp(25),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _search.clear();
              },
              icon: Icon(
                Icons.mic,
                color: Colors.grey[700],
                size: ScreenUtil().setSp(25),
              ),
            )),
      ),
    );
  }

  cardsListView() {
    return Container(
      height: 220,
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setSp(10),
          ),
          Container(
            height: 180,
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/images/food1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/images/food2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/images/food3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/images/food4.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setSp(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 15,
                height: 5,
                color: pageIndex == 0
                    ? Colors.deepOrange
                    : Colors.grey.withOpacity(0.1),
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                width: 15,
                height: 5,
                color: pageIndex == 1
                    ? Colors.deepOrange
                    : Colors.grey.withOpacity(0.1),
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                width: 15,
                height: 5,
                color: pageIndex == 2
                    ? Colors.deepOrange
                    : Colors.grey.withOpacity(0.1),
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                width: 15,
                height: 5,
                color: pageIndex == 3
                    ? Colors.deepOrange
                    : Colors.grey.withOpacity(0.1),
              ),
            ],
          )
        ],
      ),
    );
  }

  gridview() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Icon(Icons.star),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text("Top Picks"),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                if (index == 1) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent,
                      ),
                      padding: EdgeInsets.all(10),
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Free Delivery",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 2,
                    child: Container(
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12.0, top: 8),
                                  child: Text(
                                    "Trupti",
                                    style: GoogleFonts.damion(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container
                                  (
                      height:45,
                                  width: 25,

                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),bottomLeft: Radius.circular(7))),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            height: 25,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: Container(
                              height: 110,
                              child: Image.network(
                                  "http://clipart-library.com/images_k/food-transparent-background/food-transparent-background-7.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              height: 50,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Immunity ladoo",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Row(
                                      children: [
                                        Text("₹ 360",
                                            style: TextStyle(fontSize: 11)),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "00",
                                              style: TextStyle(fontSize: 6),
                                            ),
                                            Text(
                                              " ",
                                              style: TextStyle(fontSize: 6),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Text("per packet [250 gm]",
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.grey))
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _pageController = new PageController(initialPage: 0, viewportFraction: 1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));

    ScreenUtil.init(context,
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        allowFontScaling: false);

    return Scaffold(
      appBar: homePageHeader(),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(15)),
        child: Container(
          child: ListView(
            children: [
              searchBar(),
              cardsListView(),
              categoriesList(),
              gridview()
            ],
          ),
        ),
      ),
    );
  }
}
