import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/application/HotnNewBloc/hotn_new_bloc.dart';
import 'package:netflixapp/application/downloadsbloc/downloads_bloc.dart';
import 'package:netflixapp/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/domain/core/di/injectable.dart';
import 'package:netflixapp/presentation/mainpage/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CongigureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<FastLaughBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<HotnNewBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          primarySwatch: Colors.blue,
          canvasColor: Colors.black,
          scaffoldBackgroundColor: bagroundcolor,
          backgroundColor: Colors.black,

          //fontFamily: GoogleFonts.alfaSlabOne().fontFamily,
          textTheme: const TextTheme(),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
