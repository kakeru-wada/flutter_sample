import 'package:flutter/material.dart';
import '../export.dart';

class _Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      color: Colors.blue[50],
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              child: Text('Choose from over 100,000 online video courses'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 32
                  )
              ),
              child: Text('Browse all courses'),
            )
          ],
        ),
      ),
    );
  }
}

class _FigmaLogo extends StatelessWidget {
  final double size;

  const _FigmaLogo({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(8),
        color: Colors.black,
        child: Image.network(figmaLogoUrl, fit: BoxFit.contain),
      ),
    );
  }
}

class _Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 32, left: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              'Featured',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 32,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.navigate_before),
                        Container(
                          width: 180,
                          child: Column(
                            children: [
                              Text(
                                'Figma: Solid Foundations',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'The most complete beginner to advanced guide',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: _FigmaLogo(size: 48),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TrendingCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 32, bottom: 8, left: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              'Trending Courses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[100],
                    child: ListTile(
                      leading: Icon(Icons.school, color: Colors.blue),
                      trailing: Text('Communication Skills'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    color: Colors.grey[100],
                    child: ListTile(
                      leading: Icon(Icons.school, color: Colors.blue),
                      trailing: Text('Digital Marketing 101'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    color: Colors.grey[100],
                    child: ListTile(
                      leading: Icon(Icons.school, color: Colors.blue),
                      trailing: Text('UX Research'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: Text('View trending list'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;
  late Animation<Offset> _animation4;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    final tween = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-1.0, 0.0),
    );

    _animation1 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.7, curve: Curves.easeInOutBack),
    ));
    _animation2 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.1, 0.8, curve: Curves.easeInOutBack),
    ));
    _animation3 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 0.9, curve: Curves.easeInOutBack),
    ));
    _animation4 = tween.animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.3, 1.0, curve: Curves.easeInOutBack),
    ));
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //ヘッダーなど入れる
                SlideTransition(
                  position: _animation1,
                  child: Header(
                    title: 'TurtleU',
                    BackButtonvisiblity: true,
                  ),
                ),
                SlideTransition(
                  position: _animation2,
                  child: _Hero(),
                ),
                SlideTransition(
                  position: _animation3,
                  child: _Featured(),
                ),
                SlideTransition(
                  position: _animation4,
                  child: _TrendingCourses(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward().then((_) {
            Navigator.of(context)
                .push(
              PageRouteBuilder(pageBuilder: (_, __, ___) => CoursesPage()),
            )
                .then((_) => _controller.reverse());
          });
        },
        child: Icon(Icons.list),
      ),
    );
  }
}