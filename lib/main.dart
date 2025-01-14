import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/utils/get_locator.dart';
import 'package:nursery_app/core/utils/routes.dart';
import 'package:nursery_app/features/home/cubits/cubit/fetch_cubit.dart';
import 'package:nursery_app/features/start/presentation/views/cubits/cubit/predict_cubit.dart';
import 'package:nursery_app/features/start/presentation/views/cubits/cubit/sign_up_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const NurseryApp());
}

class NurseryApp extends StatelessWidget {
  const NurseryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PredictCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => FetchCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoute.router,
        theme: ThemeData.dark().copyWith(
          dialogBackgroundColor: Colors.transparent,
          textSelectionTheme:
              TextSelectionThemeData(selectionHandleColor: kSpecialColor),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kSpecialColor,
              ),
            ),
          ),
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
