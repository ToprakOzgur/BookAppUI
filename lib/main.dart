import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Readable',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white, size: 28.0),
        textTheme: TextTheme(
          title: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 1.0),
          subtitle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 1.0),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundGradient(),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNav(),
            ),
            Column(
              children: <Widget>[
                CustomBanner(),
                BookListView(
                  title: "YOUR TITLES",
                  books: [
                    'book1',
                    'book2',
                    'book3',
                    'book1',
                    'book2',
                    'book3',
                    'book1',
                    'book2',
                    'book3',
                    'book1',
                    'book2',
                    'book3'
                  ],
                ),
                BookListView(
                  title: "CLASSICS",
                  books: [
                    'book1',
                    'book2',
                    'book3',
                    'book1',
                    'book2',
                    'book3',
                    'book1',
                    'book2',
                    'book3',
                    'book1',
                    'book2',
                    'book3'
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration backgroundGradient() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.mirror,
            stops: [
          0.0,
          0.4,
          0.6,
          1
        ],
            colors: [
          Colors.blueGrey[800],
          Colors.blueGrey[700],
          Colors.blueGrey[700],
          Colors.blueGrey[800],
        ]));
  }
}

class BookListView extends StatelessWidget {
  final String title;
  final List<String> books;

  const BookListView({Key key, @required this.title, @required this.books})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        Container(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return BookCard(
                file: books[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class BookCard extends StatelessWidget {
  final String file;

  const BookCard({Key key, @required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/nazim.jpeg'),
      width: 90,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            offset: Offset(4, 5),
            blurRadius: 5,
          )
        ],
      ),
    );
  }
}

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          height: 90.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'READABLE',
                style: Theme.of(context).textTheme.title,
              ),
              Icon(Icons.search),
            ],
          )),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.refresh),
          Icon(Icons.person_outline),
          Icon(Icons.info_outline),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
