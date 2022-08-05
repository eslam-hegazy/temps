import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/bloc_observer.dart';
import 'business_logic/global_cubit/global_cubit.dart';
import 'constants/language_manager.dart';
import 'data/local/cache_helper.dart';
import 'presentation/router/app_router.dart';
import 'presentation/router/app_router_names.dart';
import 'presentation/styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      await CacheHelper.init();
      await EasyLocalization.ensureInitialized();
      runApp(EasyLocalization(
        supportedLocales: const [arabicLocal, englishLocal],
        path: assetPathLocalizations,
        fallbackLocale: englishLocal,
        child: Phoenix(child: MyApp(appRouter: AppRouter())),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({required this.appRouter, Key? key}) : super(key: key);
  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    LanguageManager.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => GlobalCubit())),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LayoutBuilder(builder: (context, constraints) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  // locale: LanguageManager.getAppLanguage(),
                  onGenerateRoute: widget.appRouter.onGenerateRoute,
                  theme: appTheme,
                );
              });
            },
          );
        },
      ),
    );
  }
}
