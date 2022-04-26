import 'package:flutter/material.dart';

class GalleryProvider extends ChangeNotifier {
  List<dynamic> _tabOneList = [
    {
      'id': 1,
      'img': Image.asset('assets/1.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 2,
      'img': Image.asset('assets/2.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 3,
      'img': Image.asset('assets/3.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 4,
      'img': Image.asset('assets/4.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 5,
      'img': Image.asset('assets/5.jpg', fit: BoxFit.cover),
      'enabled': true
    },
  ];

  List<dynamic> _tabTwoList = [
    {
      'id': 6,
      'img': Image.asset('assets/6.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 7,
      'img': Image.asset('assets/7.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 8,
      'img': Image.asset('assets/8.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 9,
      'img': Image.asset('assets/9.jpg', fit: BoxFit.cover),
      'enabled': true
    }, {
      'id': 10,
      'img': Image.asset('assets/10.jpg', fit: BoxFit.cover),
      'enabled': true
    },
  ];

  List<dynamic> get tabOneList => _tabOneList;
  List<dynamic> get tabTwoList => _tabTwoList;

  List<dynamic> getEnabledList(List<dynamic> imgList) => imgList.where((x) => x['enabled']).toList();
  List<dynamic> getDisabledList(List<dynamic> imgList) => imgList.where((x) => !x['enabled']).toList();

  setTabList(int sourceTab, List tabList){
    if(sourceTab == 1){
      _tabOneList = tabList;
    } else {
      _tabTwoList = tabList;
    }
    notifyListeners();
  }

  setEnabled(List<dynamic> imgList, int index, bool boolean){
    imgList.removeAt(index);
    notifyListeners();
  }

  transferImage(int sourceTab, List<dynamic> sourceList, int index){
    List<dynamic> targetList;
    if(sourceTab == 1){
      targetList = _tabTwoList;
    } else {
      targetList = _tabOneList;
    }
    var img = sourceList[index];
    sourceList.removeAt(index);
    targetList.add(img);
    notifyListeners();
  }
}