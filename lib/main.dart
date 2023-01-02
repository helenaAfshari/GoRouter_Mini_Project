import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  static const String title = 'GoRouter Routes';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)=> MaterialApp.router(
    //ما میتوانیم دسترسی به روترمون پیدا کنیم
     routerDelegate: _router.routerDelegate,
     //اینجا تجزیه کننده اطلاعات مسیریاب روتر هست
     routeInformationParser: _router.routeInformationParser,
     //ارایه دهنده اطلاعات go routهست که باید راه اندازی کنیم
     //تا صفحه نشان داده شود 
     routeInformationProvider: _router.routeInformationProvider,
  );
  final GoRouter _router = GoRouter(
  
    //فهرستی از مسیرهارا میگیرد 
    routes: <GoRoute>[
        GoRoute(
           //ارگومان مسیر هست
        //اسلش یعنی صفحه اول 
          path: '/',
          builder: (context, state) => Page1Screen(),
          routes: <GoRoute>[
          GoRoute(path: 'page2',
          builder: (context, state) => Page2Screen(),
          ),
       
          GoRoute(path: 'page3',
          builder: (context, state) =>  Page3Screen(),
          ),
              GoRoute(path: 'page4',
           builder: (context, state) => Page4Screen(),
          ),
         
        ])
       
        
                    
      
  ]
  );
}
 class Page1Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("ffffff")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           ElevatedButton(onPressed: () => context.go('/page2'),
            child:Text('Go to page 2')),
            SizedBox(height: 10,),
            ElevatedButton(onPressed:() => context.go('/page3'), 
            child: Text('Go to page 3')),
        ],
      ),
    ),
  );


 }

  class Page2Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("ffffff")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           ElevatedButton(onPressed:() => context.go('/'), 
            child: Text('Go back to home page')),
        ],
      ),
    ),
  );


 }
  class Page3Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("ffffff")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
                    ElevatedButton(onPressed: () => context.go('/page4'), child: Text('page4'))
        ],
      ),
    ),
  );

  }

  
  class Page4Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return
  Scaffold(
    //داخل تایتل لوکیشن صفحه را نشان میدهد
    appBar: AppBar(title: Text(router.location.toString())),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            ElevatedButton(onPressed:() => context.go('/'),child: Text('Go back to home page')),
        ],
      ),
    ),
  );
  }


 }
