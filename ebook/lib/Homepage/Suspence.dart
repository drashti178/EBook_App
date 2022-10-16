import 'package:ebook/Homepage/detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';
class SuspenceBooks extends StatefulWidget {
  const SuspenceBooks({Key? key}) : super(key: key);

  @override
  State<SuspenceBooks> createState() => _SuspenceBooksState();
}

class _SuspenceBooksState extends State<SuspenceBooks> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(

      height: size.height * 0.28,
      // color: Colors.purple,
      child: LayoutBuilder(builder: (context,constraints){
        return Column(
          children: [
            Container(
              // color: Colors.red,
              height: constraints.maxHeight * 0.18,
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth *0.03),
              child: LayoutBuilder(builder: (context,constraints){
                return Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.9,
                      width: constraints.maxWidth * 0.4,
                      color: Colors.white,
                      child: FittedBox(child: Text(
                        "Suspence Books",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(66, 66, 66, 1)),
                      )),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      width: constraints.maxWidth * 0.19,
                      color: Colors.white,
                      child: FittedBox(child: Text(
                        "View all",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5)),
                      )),
                    )
                  ],
                );
              }),
            ),
            // SizedBox(height: size.height * 0.0006,),
            Container(
              height: constraints.maxHeight * 0.815,
              // color: Colors.pink,
              child: LayoutBuilder(builder: (context,constraints){
                return ListView.builder(
                  itemCount: Booksdata.popular.length,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context, i)=> RecentUpdate(
                    detail: Booksdata.popular[i],
                  ),
                );
              },),
            )
          ],
        );
      },),
    );
  }
}
class RecentUpdate extends StatelessWidget {
  const RecentUpdate({Key? key, required this.detail}) : super(key: key);

  final Booksdata detail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
        MaterialPageRoute(
          builder:(context)=> Detailscreen(detail: detail),
        ),
      ),
      child: Column(
        children: [
          Container(

            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        detail.imagePath
                    )),
                boxShadow: [BoxShadow(
                    offset: Offset(4,2),
                    blurRadius: 3,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.1)
                )]
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 150,
            width: 110,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.8),
            height: 20,
            width: 100,
            // color: Colors.yellow,
            child: Text(
              detail.bookname,
              style: TextStyle(fontWeight: FontWeight.w400),


            ),
          )
        ],
      ),
    );
  }
}
