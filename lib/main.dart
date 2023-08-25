import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kryspy/firebase_options.dart';
import 'package:kryspy/router/router.dart';
import 'package:kryspy/screens/auth/signIn.dart';
import 'package:kryspy/screens/auth/signUp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child:  MyApp()));
  customEasyLoading();
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {

    final router=ref.read(routeProvider);
    return ScreenUtilInit(
      designSize:const  Size(360, 690),
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        title: 'KrySpy',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
          
          ),
          useMaterial3: true,
        ),
        // home: const SignInPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}


customEasyLoading(){
  EasyLoading.instance.indicatorType=EasyLoadingIndicatorType.ring;
  EasyLoading.instance.indicatorColor=Colors.white;
}
