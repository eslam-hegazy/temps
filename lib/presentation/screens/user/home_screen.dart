import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../constants/language_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('title').tr(),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      LanguageManager.changeAppLanguage();
                      Phoenix.rebirth(context);
                    },
                    child: Text('language').tr(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
