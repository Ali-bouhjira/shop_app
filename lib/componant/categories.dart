import 'package:flutter/material.dart';

import '../constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index)=>BuildCategory(index)),
      ),
    );
  }

  Widget BuildCategory (index){
    return GestureDetector(
      onTap: (){ setState(() {
        selectedindex=index;
      });},
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(categories[index],
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: selectedindex==index? kTextColor:kTextLightColor),),
            Container(
              height: 2, width:30 , color: selectedindex==index? Colors.black:Colors.transparent,
              margin: EdgeInsets.only(top: kDefaultPaddin/4),
            )

          ],
        ),
      ),
    );

  }
}
