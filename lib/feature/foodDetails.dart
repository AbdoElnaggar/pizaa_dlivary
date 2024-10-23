// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizaa_dlivary/core/colors.dart';
import 'package:pizaa_dlivary/feature/constant.dart';
import 'package:pizaa_dlivary/feature/style.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails( {super.key, required this.imagePath,});
final String imagePath;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(onPressed: (){
        
        }, 
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             PrimaryText(
                  text: 'Place an Order',
                  fontWeight: FontWeight.w600,
                  size: 18,
                ),
                Icon(Icons.chevron_right)
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
        ),
         ),
      ),
      body: ListView(
    shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(color: AppColors.lightGray, blurRadius: 40)
                        ],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: .1)),
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.chevron_left, color: AppColors.secondary),
                  ),
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(color: AppColors.lightGray, blurRadius: 50)
                      ],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: .1)),
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.star, color: AppColors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Primavera\nPizza',
                  size: 35,
                  fontWeight: FontWeight.w800,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'asset/image/dollar.svg',
                      width: 20,
                      color: AppColors.tertiary,
                    ),
                    PrimaryText(
                      text: '5.99',
                      height: 2,
                      color: AppColors.tertiary,
                      size: 33,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      text: 'size',
                      color: AppColors.lightGray,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    PrimaryText(
                      text: 'Meduim - 14"',
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                      size: 30,
                    ),
                    SizedBox(height: 12,),
                    //

                    PrimaryText(
                      text: 'Crust',
                      color: AppColors.lightGray,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    PrimaryText(
                      text: 'Thin Crust',
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                      size: 30,
                    ),
                  SizedBox(height: 12,),
                  //
                    PrimaryText(
                      text: 'Delivery in',
                      color: AppColors.lightGray,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    PrimaryText(
                      text: '30 - Min',
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                      size: 30,
                    ),

                    SizedBox(height: 12,),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: AppColors.lightGray, blurRadius: 40)
                  ]),
                  child: Image.asset(
                    'asset/image/pizza-1.png',
                    width: MediaQuery.of(context).size.width / 2.2,
                  )),
                )
              ],
            ),
          ),
          SizedBox(height: 12,),
          Padding(padding: EdgeInsets.all(10),
          child: Text('ingredients',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),
          ),
          SizedBox(
           height: 100,
            child: ListView.builder(
              itemCount: ingredients.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: AppColors.lightGray,blurRadius: 10)],
                    
                    ),
                    child: Image.asset(ingredients[index]['imagePath']!,width: 90,height: 80,),
                  ),
                );
              },
              
                
              
            ),
          )
        ],
      ),
    );
  }
}
