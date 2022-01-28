
//{
//   "url": "xxx",
//   "tabs": [
//     {
//       "labelName": "推荐",
//       "groupChannelCode": "tourphoto_global1"
//     },
//     {
//       "labelName": "拍照技巧",
//       "groupChannelCode": "tab-photo"
//     }
//   ]
// }


class TravelTabModel {
  late String? url;
  List<TravelTab>? tabs;

  TravelTabModel({this.url, this.tabs});
  TravelTabModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    List<TravelTab> tabsList =
    (json['tabs'] as List).map((i) => TravelTab.fromJson(i)).toList();
    tabs = tabsList;
  }
}

class TravelTab {
  late String? labelName;
  late String groupChannelCode;

  TravelTab({this.labelName, required this.groupChannelCode});

  TravelTab.fromJson(Map<String, dynamic> json) {
    labelName = json['labelName'];
    groupChannelCode = json['groupChannelCode'];
  }
}