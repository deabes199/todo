import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/database/shared_pref.dart';
import 'package:todo_app/core/di/dependancy_injection.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool isDark = false;

  void changeTheme() async {
    isDark = !isDark;
    await getIt<CacheHelper>().saveData(key: 'isDark', value: isDark);
    emit(SaveThemeState());
  }

  void getTheme() async {
    isDark = await getIt<CacheHelper>().getData(
      key: 'isDark',
    );
    emit(GetThemeState());
  }
}
