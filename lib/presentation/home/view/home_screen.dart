import 'package:challenge/orders/presentation/order_graph/view/order_graph_screen.dart';
import 'package:challenge/orders/presentation/order_metrics/view/order_metrics_screen.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  List<SideMenuItem> get items => [
        SideMenuItem(
          title: 'Dashboard',
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.home_outlined),
        ),
        SideMenuItem(
          title: 'Graph',
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
          icon: const Icon(Icons.auto_graph),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny))],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            footer: Text('demo'),
            onDisplayModeChanged: (mode) {},
            items: items,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                OrderMetricsScreen(),
                OrderGraphScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
