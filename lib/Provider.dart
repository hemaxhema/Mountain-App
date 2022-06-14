import 'package:flutter/cupertino.dart';

class MyProvider with ChangeNotifier {
 int NumperOfGroubSelected = 1;
 void ChangeNumber (int i){NumperOfGroubSelected = i;
 notifyListeners();}

}