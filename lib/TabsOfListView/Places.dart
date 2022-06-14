import 'package:flutter/material.dart';
import 'package:mountain_app/pages/PageOfBookTrib.dart';

class PlaceTab extends StatefulWidget {
  const PlaceTab({Key? key}) : super(key: key);

  @override
  _PlaceTabState createState() => _PlaceTabState();
}

class _PlaceTabState extends State<PlaceTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListOfPlaces.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageOfBookTrib.id,
                    arguments: ListOfPlaces[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(5, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(ListOfPlaces[index].thisString),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 250,
                width: 200,
                margin: EdgeInsets.all(15),
              ),
            );
          }),
    );
  }
}

class Place {
  final String thisString;
  final int thisPrice;
  final int ReviewStar;
  final String Country;
  final String Town;
  bool isFavourite = false;
  Place({
    required this.Country,
    required this.Town,
    required this.thisString,
    required this.thisPrice,
    required this.ReviewStar,
  });
}

List<Place> ListOfPlaces = [
  Place(
    Country: "Canada1",
    Town: "British1 Columbia1",
    thisString: "img/Places Img/mountain.jpeg",
    thisPrice: 1111,
    ReviewStar: 1,
  ),
  Place(
    Country: "Canada2",
    Town: "British2 Columbia2",
    thisString: "img/Places Img/mountain2.jpeg",
    thisPrice: 2,
    ReviewStar: 2,
  ),
  Place(
    Country: "Canada3",
    Town: "British3 Columbia3",
    thisString: "img/Places Img/mountain3.jpeg",
    thisPrice: 3,
    ReviewStar: 3,
  ),
  Place(
    Country: "Canada4",
    Town: "British4 Columbia4",
    thisString: "img/Places Img/mountain4.jpeg",
    thisPrice: 4,
    ReviewStar: 4,
  ),
];
