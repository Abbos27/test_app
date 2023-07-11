part of 'package:test_app/features/home/presentation/pages/home/home_page.dart';


mixin HomeMixin on State<HomePageBody> {
  late HomeBloc _bloc;

  void _init() {
    _bloc = context.read<HomeBloc>();
  }

  void _dispose() {
    _bloc.close();
  }
}
