import 'package:flutter/material.dart';
import 'web_view_loader.dart';

// ignore: must_be_immutable
class SubCategory extends StatelessWidget {
  int type;
  List<String> titles = ["tags", "mags"];
  List<String> _urls = ["https://vk.com", "yandex.com"];
  String category;
  List<MaterialColor> _colors = [
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.yellow
  ];

  SubCategory(this.category, this.type) {
    if (type == 0) {
      titles = [
        "Основы HTML",
        "HTML-теги",
        "HTML-атрибуты",
        "HTML-текст",
        "HTML-ссылки",
        "HTML-изображения",
        "HTML-таблицы",
        "HTML-списки",
        "Спецсимволы HTML",
        "HTML-генераторы",
        "Семантические элементы HTML5",
        "HTML5-аудио",
        'HTML5-видео',
        "HTML5-формы",
        "Контентная модель HTML5"
      ];

      _urls = [
        "https://html5book.ru/osnovy-html/",
        "https://html5book.ru/html-tags/",
        "https://html5book.ru/html-attributes/",
        "https://html5book.ru/html-text/",
        "https://html5book.ru/hyperlinks-in-html/",
        "https://html5book.ru/images-in-html/",
        "https://html5book.ru/html-table/",
        "https://html5book.ru/html-lists/",
        "https://html5book.ru/specsimvoly-html/",
        "https://html5book.ru/poleznye-servisy-html/",
        "https://html5book.ru/html5-semantic-elements/",
        "https://html5book.ru/html5-audio/",
        "https://html5book.ru/html5-video/",
        "https://html5book.ru/html5-forms/",
        "https://html5book.ru/kontentnaya-model-html5/"
      ];
    } else if (type == 1) {
      titles = [
        "Основы CSS",
        "Блочные и строчные элементы",
        "CSS-позиционирование",
        "CSS-текст",
        "CSS-шрифты",
        "CSS-ссылки",
        "CSS-таблицы",
        "CSS-списки",
        "CSS-списки",
        "CSS-фон",
        "CSS-рамка",
        "CSS-content",
        "CSS-генераторы",
        "CSS-цвета"
      ];
      _urls = [
        "https://html5book.ru/osnovy-css/",
        "https://html5book.ru/block-inline-elements/",
        "https://html5book.ru/css-position/",
        "https://html5book.ru/css-text/",
        "https://html5book.ru/css-shrifty/",
        "https://html5book.ru/styling-hyperlinks/",
        "https://html5book.ru/css3-tables/",
        "https://html5book.ru/css-spiski/",
        "https://html5book.ru/css-background/",
        "https://html5book.ru/css-border/",
        "https://html5book.ru/css-content/",
        "https://html5book.ru/generatory-css/",
        "https://html5book.ru/css-colors/",
      ];
    } else if (type == 2) {
      titles = [
        "Основы JavaScript",
        "Выражения в JavaScript",
        "Циклы JavaScript",
        "Введение в jQuery",
        "Методы jQuery",
        "События jQuery",
        "Селекторы jQuery"
      ];
      _urls = [
        "https://html5book.ru/osnovy-javascript/",
        "https://html5book.ru/vyrazheniya-v-javascript/",
        "https://html5book.ru/cikly-javascript/",
        "https://html5book.ru/cikly-javascript/",
        "https://html5book.ru/vvedenie-v-jquery/",
        "https://html5book.ru/metody-jquery/",
        "https://html5book.ru/sobytiya-jquery/",
        "https://html5book.ru/jquery-selectors/"
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebViewContainer(titles[index], _urls[index])));
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  height: 60.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: _colors[type],
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Text(
                        titles[index],
                        style: TextStyle(
                            color: type == 2 ? Colors.black : Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ));
          },
          physics: BouncingScrollPhysics(),
        ));
  }
}
