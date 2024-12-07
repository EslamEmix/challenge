import 'package:challenge/core/app_colors.dart';
import 'package:challenge/orders/presentation/order_graph/view/order_graph_screen.dart';
import 'package:challenge/orders/presentation/order_metrics/view/order_metrics_screen.dart';
import 'package:challenge/presentation/home/bloc/home_bloc.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeBloc(),
        child: const HomeScreenWithBloc());
  }
}

class HomeScreenWithBloc extends StatefulWidget {
  const HomeScreenWithBloc({super.key});

  @override
  State<HomeScreenWithBloc> createState() => _HomeScreenWithBlocState();
}

class _HomeScreenWithBlocState extends State<HomeScreenWithBloc> {
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
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: HomeBloc.currentMode,
            debugShowCheckedModeBanner: false,
            builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(
                        start: 1921, end: double.infinity, name: '4K'),
                  ],
                ),
            home: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(ToggleThemeEvent());
                      },
                      icon: Icon(
                          HomeBloc.isLight ? Icons.dark_mode : Icons.sunny))
                ],
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SideMenu(
                    controller: sideMenu,
                    items: items,
                    style: SideMenuStyle(
                        selectedTitleTextStyle: TextStyle(
                            color: HomeBloc.isLight
                                ? AppColors.contentColorBlack
                                : AppColors.contentColorWhite),
                        unselectedTitleTextStyle: TextStyle(
                            color: HomeBloc.isLight
                                ? AppColors.contentColorBlack.withOpacity(0.5)
                                : AppColors.contentColorWhite.withOpacity(0.5)),
                        unselectedIconColor: HomeBloc.isLight
                            ? AppColors.contentColorBlack.withOpacity(0.5)
                            : AppColors.contentColorWhite.withOpacity(0.5),
                        selectedIconColor: HomeBloc.isLight
                            ? AppColors.contentColorBlack
                            : AppColors.contentColorWhite),
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
            ));
      },
      listener: (BuildContext context, HomeState state) {},
    );
  }
}
