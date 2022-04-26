import 'package:carousel/providers/gallery_provider.dart';
import 'package:carousel/views/gallery_details.dart';
import 'package:carousel/views/gallery_widgets.dart/context_menu.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

class Gallery extends StatefulWidget {
  static const path = 'Gallery';
  const Gallery({ Key? key }) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final SwiperController _swipeOneCtrl = SwiperController();
  final SwiperController _swipeTwoCtrl = SwiperController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Consumer<GalleryProvider>(
                  builder: (_, gp, __) {
                    return TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.blueAccent,
                      tabs: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: Text(gp.getEnabledList(gp.tabOneList).length.toString())
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: Text(gp.getEnabledList(gp.tabTwoList).length.toString())
                        ),
                      ]
                    );
                  }
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Consumer<GalleryProvider>(
                        builder: (consumerContext, gp, _) {
                          List<dynamic> tabList = gp.tabOneList;
                          List<dynamic> enabledList = gp.getEnabledList(tabList);

                          return Swiper(
                            autoplay: true,
                            autoplayDelay: 5000,
                            autoplayDisableOnInteraction: true,
                            controller: _swipeOneCtrl,
                            itemBuilder: (BuildContext swiperContext, int i){

                              return GestureDetector(
                                onTap: () {
                                  _swipeOneCtrl.stopAutoplay();
                                  Navigator.pushNamed(swiperContext, GalleryDetails.path, arguments: {'img': enabledList[i]['img']});
                                },
                                onLongPress: () {
                                  
                                  _swipeOneCtrl.stopAutoplay();
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false, 
                                    builder: (_) => ContextMenu(sourceTab: 1, tabList: tabList, gp: gp)
                                  );
                                },
                                child: enabledList[i]['img']
                              );
                            },
                            itemCount: enabledList.length,
                          );
                        }
                      ),
                      Consumer<GalleryProvider>(
                        builder: (consumerContext, gp, _) {
                          List<dynamic> tabList = gp.tabTwoList;
                          List<dynamic> enabledList = gp.getEnabledList(tabList);

                          return Swiper(
                            autoplay: true,
                            autoplayDelay: 5000,
                            autoplayDisableOnInteraction: true,
                            controller: _swipeTwoCtrl,
                            itemBuilder: (BuildContext swiperContext, int i){

                              return GestureDetector(
                                onTap: () {
                                  _swipeTwoCtrl.stopAutoplay();
                                  Navigator.pushNamed(swiperContext, GalleryDetails.path, arguments: {'img': enabledList[i]['img']});
                                },
                                onLongPress: () {
                                  
                                  _swipeTwoCtrl.stopAutoplay();
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false, 
                                    builder: (_) => ContextMenu(sourceTab: 2, tabList: tabList, gp: gp)
                                  );
                                 
                                },
                                child: enabledList[i]['img']
                              );
                            },
                            itemCount: enabledList.length,
                          );
                        }
                      ),
                    ]
                  )
                ),
                Container(
                  height: 70,
                  color: Colors.blueGrey,
                  width: double.infinity,
                  child: TextButton(
                    key: const Key('LogoutButton'),
                    onPressed: () => Navigator.pop(context), 
                    child: const Text('Logout', style: TextStyle(fontSize: 21, color: Colors.white))
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}