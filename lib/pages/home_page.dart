import 'package:flutter/material.dart';
import 'package:one_article/bean/article_bean.dart';

class HomePage extends StatefulWidget {
  final ArticleBean article;

  HomePage(this.article);

  @override
  State<StatefulWidget> createState() => _HomePageState(article);
}

class _HomePageState extends State<HomePage> {
  ArticleBean article;

  _HomePageState(this.article);

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      article = ArticleBean();
      article.title = "加载中";
      article.content = "加载中";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Text.rich(
              TextSpan(
                  text: article.date == null? "" : "(${article.date.curr}，作者：${article.author}，字数：${article.wc})",
                  style:
                      TextStyle(color: Colors.grey, fontSize: 15, height: 1.4)),
              textAlign: TextAlign.end),
          Text(
            article.content,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          )
        ],
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}