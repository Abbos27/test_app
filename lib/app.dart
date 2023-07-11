import 'package:auto_route/auto_route.dart';
import 'package:test_app/core/app_bloc/app_bloc.dart';
import 'package:test_app/core/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:test_app/injector_container.dart';
import 'package:test_app/routes/guards/auth_guard.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) {
        return KeyboardDismisser(
          child: MaterialApp.router(
            title: 'Test app',
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            routerConfig: appRouter.config(
              reevaluateListenable: sl<AuthService>(),
            ),
          ),
        );
      },
    );
  }
}

@RoutePage()
class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({Key? key}) : super(key: key);
}
