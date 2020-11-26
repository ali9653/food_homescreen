import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
      height: 140,
      child: Column(
        children: [
          Divider(thickness: 0.5,),
          Container(
            height: 75,
            child: ListView.builder(


              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 17,vertical: 5),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(categoryList[index].imageUrl,height: 40,width: 50,fit: BoxFit.cover,),
                      SizedBox(height: 7,),
                      Text(categoryList[index].title),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(thickness: 0.5,),
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
              Icon(
                MyIcons.shopping_cart,
                color: Colors.grey[800],
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
          child: Column(
            children: [
              searchBar(),
              cardsListView(),
              categoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
