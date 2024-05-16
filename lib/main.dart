import 'package:flutter/material.dart';
import 'package:coiner/bloc_map/map_bloc.dart';
import 'package:coiner/bloc_map/map_event.dart';
import 'package:coiner/bloc_profile/profile_event.dart';
import 'package:coiner/bloc_support/support_bloc.dart';
import 'package:coiner/bloc_profile/profile_bloc.dart';
import 'package:coiner/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Request location permissions
  await Geolocator.requestPermission();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapBloc()..add(LoadCurrentLocation()),
        ),
        BlocProvider(
          create: (context) => SupportBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(LoadProfile()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
