import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'web_view_loader.dart';
import 'sub_category.dart';

class MainBody extends StatelessWidget {
  final List<String> _trendingImages = [
    'https://images.pexels.com/photos/35857/amazing-beautiful-breathtaking-clouds.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.unsplash.com/photo-1507608616759-54f48f0af0ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    'https://images.pexels.com/photos/1037992/pexels-photo-1037992.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
  ];
  final List<String> _popularImages = [
    'https://designshack.net/wp-content/uploads/html5.png',
    'https://cetera.ru/uploads/20181122/css_2.png',
    'https://prodvizhenie.com.ua/wp-content/uploads/2018/02/JavaScript.png'
  ];

  final List<String> _urls = [
    'https://html5book.ru/html-html5/',
    'https://html5book.ru/css-css3/',
    'https://html5book.ru/javascript-jquery/'
  ];

  final List<String> _urlName = ['HTML', 'CSS', 'Javascript'];

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Учебная методика"),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ListView.builder(
                itemCount: _popularImages.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubCategory(_urlName[index], index)));
                      },
                      child: Hero(
                        tag: 'popular$index',
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: FadeInImage(
                              image: NetworkImage(_popularImages[index]),
                              fit: BoxFit.cover,
                              placeholder:
                                  AssetImage('assets/images/loading.gif'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
