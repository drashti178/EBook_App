import 'package:ebook/Homepage/detail_screen.dart';
import 'package:ebook/models/data.dart';
import 'package:flutter/material.dart';


class PopularBooks extends StatefulWidget {
  // PopularBooks({Key? key}) : super(key: key);
  // final Booksdata detail;
  @override
  State<PopularBooks> createState() => _PopularBooksState();
}

class _PopularBooksState extends State<PopularBooks> {
  // _PopularBooksState(Booksdata detail);

 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Popular',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
        //load info book
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 550,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: Booksdata.popular.length,
            itemBuilder: (context, i) => RecentUpdate(
              detail: Booksdata.popular[i],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );


  }
}
class RecentUpdate extends StatelessWidget {
  const RecentUpdate({Key? key, required this.detail}) : super(key: key);
  final Booksdata detail;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Detailscreen(detail: detail),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: detail.id,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      height: 180,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            detail.imagePath,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text
                      SizedBox(
                        width: 180,
                        child: Text(
                          detail.bookname,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      //authors
                      SizedBox(
                        width: 150,
                        height: 30,
                        child: Text(
                          detail.authorName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueAccent),
                        ),
                      ),
                      //decription
                      SizedBox(
                        width: 150,
                        height: 80,
                        child: Text(
                          detail.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Container(
//
// height: size.height * 0.28,
// // color: Colors.purple,
// child: LayoutBuilder(builder: (context,constraints){
// return Column(
// children: [
// Container(
// // color: Colors.red,
// height: constraints.maxHeight * 0.18,
// padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth *0.03),
// child: LayoutBuilder(builder: (context,constraints){
// return Row(
//
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: constraints.maxHeight * 0.9,
// width: constraints.maxWidth * 0.25,
// color: Colors.white,
// child: FittedBox(child: Text(
// "Popular",
// style: TextStyle(fontWeight: FontWeight.bold,
// color: Color.fromRGBO(66, 66, 66, 1)),
// )),
// ),
// Container(
// height: constraints.maxHeight * 0.6,
// width: constraints.maxWidth * 0.19,
// color: Colors.white,
// child: FittedBox(child: Text(
// "View all",
// style: TextStyle(fontWeight: FontWeight.w400,
// color: Colors.black.withOpacity(0.5)),
// )),
// )
// ],
// );
// }),
// ),
// // SizedBox(height: size.height * 0.0006,),
// Container(
// height: constraints.maxHeight * 0.815,
// // color: Colors.pink,
// child: LayoutBuilder(builder: (context,constraints){
// return ListView.builder(
// itemCount: Booksdata.popular.length,
// scrollDirection: Axis.horizontal,
//
// itemBuilder: (context, i)=> RecentUpdate(
// detail: Booksdata.popular[i],
// ),
// );
// },),
// )
// ],
// );
// },),
// );
