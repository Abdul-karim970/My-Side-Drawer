import 'package:flutter/material.dart';

import 'drawer_clipper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Drawer',
        size: size,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.size});

  final String title;
  final Size size;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late double width;
  late double height;

  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _itemsOpacityAnimation;
  late Animation<double> _horizontalAlignAnimation;
  late Animation<double> _verticalAlignAnimation;
  late Animation<double> _iconAnimation;
  late Animation<double> _radiusAnimation;

  double itemsSpace = 10;

  @override
  void initState() {
    super.initState();

    width = widget.size.width;
    height = widget.size.height;

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 0.7)));
    _horizontalAlignAnimation = Tween<double>(begin: -0.9, end: -0.58).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.7)));
    _verticalAlignAnimation = Tween<double>(begin: -0.9, end: -0.55).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.7)));

    _widthAnimation = Tween<double>(begin: width * 0.12, end: width * 0.8)
        .animate(CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.7)));
    _heightAnimation = Tween<double>(begin: height * 0.07, end: height * 0.7)
        .animate(CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.7)));
    _iconAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 0.7)));
    _radiusAnimation = Tween<double>(begin: 10, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 0.7)));
    _itemsOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.75, 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(_horizontalAlignAnimation.value,
                  _verticalAlignAnimation.value),
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: ClipPath(
                  clipper: DrawerClipper(),
                  child: Container(
                    alignment: Alignment.center,
                    width: _widthAnimation.value,
                    height: _heightAnimation.value,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          )
                        ],
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(20)),
                    child: Opacity(
                      opacity: _itemsOpacityAnimation.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home_max_outlined,
                                color: Colors.blueGrey.shade600,
                                size: 30,
                              ),
                              SizedBox(
                                width: itemsSpace,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: width * 0.05,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_outline_outlined,
                                color: Colors.blueGrey.shade600,
                                size: 30,
                              ),
                              SizedBox(
                                width: itemsSpace,
                              ),
                              Text(
                                'Your Profile',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: width * 0.05,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.medical_information_outlined,
                                color: Colors.blueGrey.shade600,
                                size: 30,
                              ),
                              SizedBox(
                                width: itemsSpace,
                              ),
                              Text(
                                'Installment Info',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: width * 0.05,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.groups_2_outlined,
                                color: Colors.blueGrey.shade600,
                                size: 30,
                              ),
                              SizedBox(
                                width: itemsSpace,
                              ),
                              Text(
                                'Your Group',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: width * 0.05,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.groups_2_outlined,
                                color: Colors.blueGrey.shade600,
                                size: 30,
                              ),
                              SizedBox(
                                width: itemsSpace,
                              ),
                              Text(
                                'All Groups',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: width * 0.05,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.business_rounded,
                                color: Colors.blueGrey.shade600,
                              ),
                              SizedBox(
                                width: itemsSpace,
                              ),
                              Text(
                                'About',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: width * 0.05,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.9, -0.9),
              child: InkWell(
                onTap: () {
                  if (_animationController.status ==
                      AnimationStatus.completed) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.12,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: Radius.circular(_radiusAnimation.value),
                          bottomLeft: Radius.circular(_radiusAnimation.value),
                          bottomRight:
                              Radius.circular(_radiusAnimation.value))),
                  child: AnimatedIcon(
                      color: Colors.blueGrey.shade50,
                      icon: AnimatedIcons.menu_close,
                      size: 30,
                      progress: _iconAnimation),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
