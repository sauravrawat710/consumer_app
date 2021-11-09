import 'package:consumer_app/core/datamodel/post.dart';
import 'package:consumer_app/core/logic/home_cubit.dart';
import 'package:consumer_app/core/presentation/widgets/widgets.dart';
import 'package:consumer_app/core/utlis/active_user.dart';
import 'package:consumer_app/core/utlis/global.dart';
import 'package:consumer_app/core/utlis/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  //had to remove const because locator homecubit
  //const
  HomeScreen({Key? key}) : super(key: key);

  final HomeCubit homeCubit = locator.get<HomeCubit>();
  final ActiveUser _activeUser = locator.get<ActiveUser>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          floatingActionButton:
              (GetIt.instance.get<ActiveUser>().user!.userType != "merchant")
                  ? Container()
                  : FloatingActionButton(onPressed: () {
                      context.read<HomeCubit>().FAB();
                    }),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.grey),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                "VoloDEALS",
                style: TextStyle(color: Colors.redAccent),
              ),
              actions: [
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ]),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 135.h,
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Welcome\nback ${_activeUser.user!.username!.split(' ')[0]},",
                                style: TextStyle(fontSize: 50.w),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.all(5),
                            //   child: Text(
                            //     "",
                            //     "back ,",
                            //     style: TextStyle(fontSize: 50),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      bloc: context.read<HomeCubit>(),
                      builder: (context, state) {
                        return SliverAppBar(
                          pinned: true,
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          flexibleSpace: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List<Widget>.generate(
                                    categories.length,
                                    (index) => TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.all(16.0),
                                            primary:
                                                (index == state.catSelected)
                                                    ? Colors.black
                                                    : Colors.grey,
                                            textStyle:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<HomeCubit>()
                                                .changeSelectedCat(index);
                                          },
                                          child: Text(categories[index]),
                                        ))),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      bloc: context.read<HomeCubit>(),
                      builder: (context, state) {
                        print(state.toString());
                        return SliverList(
                            delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            if (state.isLoading() ?? true) {
                              return const postCardWidget.loading();
                            } else {
                              return postCardWidget(
                                post: state.posts[index],
                              );
                            }
                          },
                          childCount:
                              state.isLoading()! ? 5 : state.posts.length,
                        ));
                      },
                    ),
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
