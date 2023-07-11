import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/theme/colors/theme_colors.dart';
import 'package:test_app/core/theme/text/theme_text_styles.dart';
import 'package:test_app/core/utils/app_utils.dart';
import 'package:test_app/features/auth/domain/entities/login/login_response_entity.dart';
import 'package:test_app/injector_container.dart';
import 'package:test_app/routes/guards/auth_guard.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserEntity? _user;

  @override
  void initState() {
    try {
      _user = localSource.getUser().user;
    } catch (e) {
      debugPrint("USER NOT FOUND");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile page"),
      ),
      body: ListView(
        children: [
          AppUtils.kBoxHeight24,
          SvgPicture.asset(
            'assets/svg/ic_profile.svg',
            width: 64,
            height: 64,
          ),
          AppUtils.kBoxHeight12,
          Center(
            child: Text(
              _user?.nickname ?? '',
              style: ThemeTextStyles.blackBold24,
            ),
          ),
          AppUtils.kBoxHeight8,
          Center(
            child: Text(
              _user?.email ?? '',
              style: ThemeTextStyles.greyRegular16,
            ),
          ),
          AppUtils.kBoxHeight12,
          InkWell(
            onTap: ()async {
              await localSource.clear();
              sl<AuthService>().isAuthenticated = false;
            },
            child: Ink(
              color: ThemeColors.white,
              child: const Padding(
                padding: AppUtils.kPaddingVer12Hor24,
                child: Text(
                  "Выйти",
                  style: ThemeTextStyles.redRegular16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
