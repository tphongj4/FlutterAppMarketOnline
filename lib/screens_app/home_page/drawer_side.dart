import 'package:flutter/material.dart';
import 'package:market_online_app/config/colors.dart';
import 'package:market_online_app/providers/user_provider.dart';
import 'package:market_online_app/screens_app/cart_review/cart_review.dart';
import 'package:market_online_app/screens_app/home_page/home_screen.dart';
import 'package:market_online_app/screens_app/main_profile/my_profile.dart';
import 'package:market_online_app/screens_app/wish_list/wish_list.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({this.userProvider});
  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({String title, IconData iconData, Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        width: 100,
        color: scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          userData.userImage ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7nFdX1g_CVR4WyP5LgKOGytP0J8PE53_RQ&usqp=CAU",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userData.userName,
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          userData.userEmail,
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
                iconData: Icons.home_outlined,
                title: "Trang ch???",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                }),
            listTile(
                iconData: Icons.shop_outlined,
                title: "Xem l???i gi??? h??ng",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                }),
            listTile(
                iconData: Icons.person_outlined,
                title: "H??? s?? c???a b???n",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          MyProfile(userProvider: widget.userProvider),
                    ),
                  );
                }),
            listTile(
                iconData: Icons.notifications_outlined, title: "Th??ng b??o"),
            listTile(
                iconData: Icons.star_outline, title: "X???p h???ng v?? ????nh gi??"),
            listTile(
                iconData: Icons.favorite_outline,
                title: "S???n ph???m y??u th??ch",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WishList(),
                    ),
                  );
                }),
            listTile(
                iconData: Icons.copy_outlined, title: "Ph???n h???i ch???t l?????ng"),
            listTile(iconData: Icons.format_quote_outlined, title: "H???i ????p"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Li??n h??? h??? tr???"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("G???i: "),
                      SizedBox(
                        width: 10,
                      ),
                      Text("0934717617"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("G???i mail: "),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Team7@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
