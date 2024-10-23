// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, body_might_complete_normally_nullable, non_constant_identifier_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizaa_dlivary/core/colors.dart';
import 'package:pizaa_dlivary/feature/constant.dart';
import 'package:pizaa_dlivary/feature/foodDetails.dart';
import 'package:pizaa_dlivary/feature/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int selected = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.all(12),
          child: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('asset/image/man.jpeg'),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'asset/image/menu.svg',
                width: 55,
              )),
          SizedBox(
            width: 20,
          )
        ],
        // leading: ClipRRect(
        //   child: Image.asset('asset/image/man.jpeg'),
        //   borderRadius: BorderRadius.circular(10),
        // ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PrimaryText(
                  text: 'Food',
                  size: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  text: 'Delvariy',
                  size: 42,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
                iconSize: 33,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightGray)),
                      hintText: 'search',
                      hintStyle: TextStyle(fontSize: 20)),
                ),
              )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Categoris",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodcatagorylist.length,
              itemBuilder: (context, int index) {
                return FoodCardList(foodcatagorylist[index]["imapgepath"],
                    foodcatagorylist[index]['name'], index);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Popular",
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              ListView.builder(  
                  scrollDirection: Axis.vertical,           
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: mainpopularfoodlist.length,
                  itemBuilder: (context, int index) {
                    return popularListFood(
                        context,
                        mainpopularfoodlist[index]['imagePath']!,
                        mainpopularfoodlist[index]['name']!,
                        mainpopularfoodlist[index]['weight']!,
                        mainpopularfoodlist[index]['star']!);
                  }),
            ],
          )
        ],
      ),
    );
  }

  InkWell popularListFood(BuildContext context, String imagepath, String name,
      String weight, String star,) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodDetails( imagePath: imagepath,)));
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 10)]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 16,
                      icon: Icon(Icons.star),
                      color: AppColors.primary,
                    ),
                    PrimaryText(
                      text: 'Top of The Week',
                      size: 16,
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    weight,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGray),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      height: 45,
                      child: MaterialButton(
                        onPressed: () {},
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.add,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.star,
                        color: AppColors.secondary,
                        size: 12,
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      star,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary),
                    ),
                  ],
                )
              ],
            ),
            Container(
              
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: AppColors.lightGray, blurRadius: 40)
                ]),
                child: Hero(
                  tag: imagepath,
                  child: Image.asset(
                    imagepath,
                    width: MediaQuery.of(context).size.width / 3.6,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  GestureDetector FoodCardList(String? imagepath, String? name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 10)],
          borderRadius: BorderRadius.circular(12),
          color: selected == index ? AppColors.primary : AppColors.white,
        ),
        width: 120,
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
              imagepath ?? '',
              width: 50,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              name!,
              style: TextStyle(fontSize: 22),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: selected == index ? AppColors.white : AppColors.tertiary,
                shape: BoxShape.circle,
              ),
              height: 35,
              child: MaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: Icon(
                  Icons.chevron_right,
                  color:
                      selected == index ? AppColors.secondary : AppColors.white,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
