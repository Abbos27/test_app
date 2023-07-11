import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/theme/colors/theme_colors.dart';
import 'package:test_app/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:test_app/injector_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/routes/app_router.dart';

part 'package:test_app/features/home/presentation/pages/home/mixins/home_mixin.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with HomeMixin, TickerProviderStateMixin {
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {},
      builder: (_, state) {
        return AutoTabsScaffold(
          routes: const [
            FeedRoute(),
            MapRoute(),
            FavouritesRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items:  [
                _buildBottomNavigationBarItem(
                  label: 'Feed',
                  svgName: "ic_feed",
                ),
                _buildBottomNavigationBarItem(
                  label: 'Map',
                  svgName: "ic_map",
                ),
                _buildBottomNavigationBarItem(
                  label: 'Favourites',
                  svgName: "ic_favourite",
                ),
                _buildBottomNavigationBarItem(
                  label: 'Profile',
                  svgName: "ic_profile",
                ),
              ],
            );
          },
        );
      },
    );
  }
}

BottomNavigationBarItem _buildBottomNavigationBarItem({
  required String label,
  required String svgName,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: SvgPicture.asset(
      "assets/svg/$svgName.svg",
      width: 18,
      height: 18,
    ),
    activeIcon: SvgPicture.asset(
      "assets/svg/$svgName.svg",
      width: 18,
      height: 18,
      colorFilter: const ColorFilter.mode(ThemeColors.secondaryColor, BlendMode.srcIn),
    ),
  );
}
