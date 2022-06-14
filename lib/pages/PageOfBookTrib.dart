import 'package:flutter/material.dart';
import 'package:mountain_app/TabsOfListView/Places.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:mountain_app/widgets/ButtonResponsive.dart';
import 'package:mountain_app/widgets/NumberOfGroupWidget.dart';

import '../widgets/TextReviewText.dart';

int SelectedNumOfGroup = 1;

class PageOfBookTrib extends StatelessWidget {
  static const id = "PageOfBookTrib";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Place ThisPlace = ModalRoute.of(context)!.settings.arguments as Place;
    String name = ThisPlace.Town;
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage(ThisPlace.thisString),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.topCenter,
                  height: height / 2 + 100,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: Column(
                    children: [
                      ////////////////////////       The Bottom Children            ///////////////
                      TopNameAndPrice(name, ThisPlace),
                      SecondRowCountryAndTown(ThisPlace),
                      Review(ThisPlace),
                      TextReviewText(),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isFavouriteWidget(ThisPlace: ThisPlace),
                            ResponsiveButton(
                              hasText: true,
                              thisText: "Book Trip Now",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  alignment: Alignment.bottomCenter,
                  height: height / 2 + 125,
                ),
              ),
            ],
          )),
    );
  }

  Padding Review(Place ThisPlace) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 19, bottom: 5),
      child: Row(
        children: [
          ...List.generate(
            5,
            (index) {
              return Icon(
                Icons.star,
                color:
                    index < ThisPlace.ReviewStar ? Colors.amber : Colors.grey,
              );
            },
          ),
          Text(
            "(${ThisPlace.ReviewStar}.0)",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Padding SecondRowCountryAndTown(Place ThisPlace) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.location_on, color: AppColors.mainColor),
          Text(
            " ${ThisPlace.Country}, ${ThisPlace.Town}",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          )
        ],
      ),
    );
  }

  Padding TopNameAndPrice(String name, Place ThisPlace) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$${ThisPlace.thisPrice}",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor),
          )
        ],
      ),
    );
  }
}

class isFavouriteWidget extends StatefulWidget {
  const isFavouriteWidget({
    Key? key,
    required this.ThisPlace,
  }) : super(key: key);

  final Place ThisPlace;

  @override
  State<isFavouriteWidget> createState() => _isFavouriteWidgetState();
}

class _isFavouriteWidgetState extends State<isFavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.ThisPlace.isFavourite = !widget.ThisPlace.isFavourite;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color:
              widget.ThisPlace.isFavourite ? AppColors.mainColor : Colors.white,
        ),
        child: Center(
          child: Icon(
            widget.ThisPlace.isFavourite
                ? Icons.favorite
                : Icons.favorite_border,
            color: widget.ThisPlace.isFavourite
                ? Colors.white
                : AppColors.mainColor,
          ),
        ),
        height: 55,
        width: 55,
      ),
    );
  }
}
