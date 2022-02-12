import 'package:flutter/material.dart';
import 'package:nanoshop_app/providers/navigation_bar_provider.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/home_page.dart';
import 'package:nanoshop_app/screens/home_screen/widget/home_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NavigationBarProvider(),
      child: Scaffold(
        body: Consumer<NavigationBarProvider>(
          builder: (context, _model, child) => IndexedStack(
            index: _model.currentTab,
            children: [
              HomePage(),
              HomePage(),
              HomePage(),
              HomePage(),
              HomePage(),
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomNavigationBar(),
      ),
    );
  }
}
