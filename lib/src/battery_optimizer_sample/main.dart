import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'dart:math';

const kColorPurple = Color(0xFF8337EC);
const kColorPink = Color(0xFFFF006F);
const kColorIndicatorBegin = kColorPink;
const kColorIndicatorEnd = kColorPurple;
const kColorTitle = Color(0xFF616161);
const kColorText = Color(0xFF9E9E9E);
const kElevation = 4.0;

class BatteryOptimizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: kColorTitle),
        ),
        backgroundColor: Colors.white,
      ),
      home: BatteryOptimizerPage(),
    );
  }
}

class BatteryOptimizerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Battery Optimizer'),
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return appListPage();
              })
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Widgetを並べる
              OptimizerButtons(),
              BatteryLevelIndicator(),
              AppsDrainage(),
              OptimizeNow()
            ],
          ),
        ),
      ),
    );
  }
}

class _OptimizerButton extends StatelessWidget {
  final String text;

  const _OptimizerButton({
    Key? key,
    required this.text,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        )
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: kColorTitle,fontSize: 12),
      ),
    );
  }
}

class OptimizerButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SizedBox(width: 16,),
            _OptimizerButton(text: 'Battery Optimizer',),
            SizedBox(width: 16,),
            _OptimizerButton(text: 'Connection Optimizer'),
            SizedBox(width: 16,),
            _OptimizerButton(text: 'Memory Optimizer'),
            SizedBox(width: 16,),
            _OptimizerButton(text: 'Storage Optimizer'),
            SizedBox(width: 16,),
          ],
        ),
      ),
    );
  }
}

class _BatteryLevelIndicatorPainter extends CustomPainter {
  final double percentage;
  final double textCircleRadius;

  _BatteryLevelIndicatorPainter({
    required this.percentage,
    required this.textCircleRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i += 5) {
      final per = i / 360.0;
      final color = ColorTween(
        begin: kColorIndicatorBegin,
        end: kColorIndicatorEnd,
      ).lerp(per)!;
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      final spaceLen = 16;
      final lineLen = 24;
      final angle = (2 * pi * per) - (pi / 2);

      final offset0 = Offset(size.width * 0.5, size.height * 0.5);

      final offset1 = offset0.translate(
        (textCircleRadius + spaceLen) * cos(angle),
        (textCircleRadius + spaceLen) * sin(angle),
      );
      final offset2 = offset1.translate(
        lineLen * cos(angle),
        lineLen * sin(angle),
      );

      canvas.drawLine(offset1, offset2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BatteryLevelIndicator extends StatelessWidget {
  final percentage = 0.7;
  final size = 164.0;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BatteryLevelIndicatorPainter(
        percentage: percentage,
        textCircleRadius: size * 0.5,
      ),
      child: Container(
        padding: const EdgeInsets.all(64),
        child: Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(size * 0.5),
          child: Container(
            width: size,
            height: size,
            child: Center(
              child: Text(
                '${percentage * 100}%',
                style: TextStyle(color: kColorPink, fontSize: 48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HorizontalBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey[200],
    );
  }
}

class _AppColumn extends StatelessWidget {
  final String name;
  final Icon icon;
  final String percentage;

  const _AppColumn({
    Key? key,
    required this.name,
    required this.icon,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        name,
        style: TextStyle(color: kColorText),
      ),
      trailing: Text(
        percentage,
        style: TextStyle(color: kColorText),
      ),
    );
  }

}

class AppsDrainage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
            child: Container(
              color: kColorPurple,
              child: Icon(Icons.apps, color: Colors.white,),
            ),
          ),
          title: Text(
            'Apps Drainage',
            style: TextStyle(color: kColorTitle),
          ),
          subtitle: Text(
            'Show the most draining energy application',
            style: TextStyle(color: kColorText),
          ),
        ),
        Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              _AppColumn(
                icon: Icon(Icons.sms, color: Colors.indigo),
                name: 'SMSApp',
                percentage: '75%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(Icons.live_tv, color: Colors.red),
                name: 'MovieApp',
                percentage: '60%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(Icons.place, color: Colors.green),
                name: 'MapApp',
                percentage: '35%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(Icons.local_grocery_store, color: Colors.orange),
                name: 'ShoppingApp',
                percentage: '35%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(Icons.train, color: Colors.black),
                name: 'TrainApp',
                percentage: '15%',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class OptimizeNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kColorPurple,
          padding: EdgeInsets.symmetric(horizontal: 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          )
        ),
        onPressed: () {},
        child: Text('optimize now' , style: TextStyle(color: Colors.white),),
      ),
    );
  }
}




















































