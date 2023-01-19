import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jazenet_app/model/contact_list_model.dart';
import 'package:jazenet_app/service/api_service.dart';
import 'package:jazenet_app/service/api_urls.dart';
import 'package:logger/logger.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  ContactList? contactList;
  final alphabets =
  List.generate(26, (index) => String.fromCharCode(index + 65));
  String selAlphabet = "a";
  int searchIndex = 0;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();

  void setSearchIndex(String searchLetter) {
      searchIndex = contactList!.result.jazenetContactList.compResults.indexWhere((element) => element.name[0].toLowerCase() == searchLetter);
      if (searchIndex > 0){
        itemScrollController.jumpTo(index: searchIndex);
      }
      notifyListeners();
  }
  setOrder(String val){
    selAlphabet = val;
    notifyListeners();
    setSearchIndex(val);
  }

  getData(BuildContext context) async{
    String url =
        "${ApiUrls().baseUrl}general/jazenet_contact_list";
    Map<String, String> header = {
      "Content-Type": "application/json",
    };
    Map<String, dynamic> data = {
      "api_token": "jazenet",
      "account_id": "100",
    };
    var response = await apiService.postApi(
        context: context,
        url: url,
        header: header,
        body: data);
    print("API RESPONSE : ");
    Logger().d(response);
    if (response != null) {
      if(response["success"] == "1"){
        contactList = ContactList.fromJson(response);
        contactList!.result.jazenetContactList.compResults.sort((a, b) {
          return a.name.toString().toLowerCase().compareTo(b.name.toString().toLowerCase());
        });
        notifyListeners();
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response["errorMessage"]),
            elevation: 0,
          ),
        );
      }

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something Went Wrong!"),
          elevation: 0,
        ),
      );
    }
  }
}
