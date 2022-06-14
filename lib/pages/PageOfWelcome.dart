import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mountain_app/ListsOfWelcomePage.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:mountain_app/pages/PagesOfBottomNav/PageOfMainNav.dart';
import 'package:mountain_app/widgets/ButtonResponsive.dart';

double CurrnetPage = 0;
PageController controller = PageController(
  initialPage: 0,
);

class PageOfWelcome extends StatefulWidget {
  static const id = "PageOfWelcome";

  @override
  State<PageOfWelcome> createState() => _PageOfWelcomeState();
}

class _PageOfWelcomeState extends State<PageOfWelcome> {
  _pageListener() {
    CurrnetPage = controller.page!;
    setState(() {});
  }

  @override
  void initState() {
    controller.addListener(() {
      _pageListener();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: controller,
          itemCount: ListOfPages.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ListOfPages[index].AssetImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100),
                        LargeText(),
                        SecondryText(),
                        SizedBox(height: 25),
                        ChangeableText(
                          ListOfPages[index].ChangeableText,
                        ),
                        Text("$index"),
                        NextButton(thisFunc: NextPageFunc, context: context),
                      ],
                    ),
                    // the right side of dots
                    Column(children: [
                      SizedBox(height: 100),
                      ...List.generate(ListOfPages.length, (numberofdot) {
                        if (numberofdot == index) {
                          return TallDotOnLeft();
                        } else {
                          return ShortDotOnLeft();
                        }
                      }),
                    ])
                  ],
                ),
              ),
            );
          }),
    );
  }

  Text LargeText() {
    return Text(
      "Trips",
      style: TextStyle(
          fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Text SecondryText() {
    return Text(
      "Mountain",
      style: TextStyle(
          fontSize: 32, color: Color(0xff767676), fontWeight: FontWeight.w300),
    );
  }

  Container ShortDotOnLeft() {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
      ),
      height: 10,
      width: 10,
    );
  }

  Container TallDotOnLeft() {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.mainColor,
      ),
      height: 24,
      width: 10,
    );
  }

  static void NextPageFunc(BuildContext context) {
    if (CurrnetPage < ListOfPages.length - 1) {
      controller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      print(CurrnetPage);
    } else {
      Navigator.pushNamed(context, PageOfMainNav.id);
      print("the last page");
    }
  }
}

// the end of the page {};////////////////////////////////////////////////////
class ChangeableText extends StatelessWidget {
  final String thisText;
  ChangeableText(this.thisText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Text(
        thisText,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}

class NextButton extends StatefulWidget {
  final Function thisFunc;
  NextButton({required this.thisFunc, required BuildContext context});
  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ResponsiveButton(hasText: false),
      onTap: () {
        widget.thisFunc(context);
      },
    );
  }
}
