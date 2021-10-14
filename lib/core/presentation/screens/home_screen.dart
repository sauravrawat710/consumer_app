import 'package:consumer_app/core/datamodel/post.dart';
import 'package:consumer_app/core/presentation/widgets/widgets.dart';
import 'package:consumer_app/core/utlis/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  static const Post getpostfromCUBITandpassindex = Post.empty();
  static const int getPostsLengthFromCybut = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          print("Hamburger menu");
                        }),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text("VoloDEALS"),
                    Expanded(
                      child: SizedBox(),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          print("Hamburger menu");
                        }),
                  ],
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 130,
                      backgroundColor: Colors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Welcome\nback User",
                                style: TextStyle(fontSize: 50),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.all(5),
                            //   child: Text(
                            //     "",
                            //     "back $user,",
                            //     style: TextStyle(fontSize: 50),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: Colors.white,
                      flexibleSpace: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories
                              .map<Widget>((categoryData) =>
                                  CategoryWidget(data: categoryData))
                              .toList(),
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) =>
                          PostCardWidget(post: getpostfromCUBITandpassindex),
                      childCount: getPostsLengthFromCybut,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
