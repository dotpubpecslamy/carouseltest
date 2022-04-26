import 'package:carousel/providers/gallery_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget {
  const ContextMenu({ 
    Key? key, 
    required this.sourceTab, 
    required this.tabList, 
    required this.gp }) : super(key: key);

  final List<dynamic> tabList;
  final int sourceTab;
  final GalleryProvider gp;

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Consumer<GalleryProvider>(
        builder: (consCtxt, g, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              for (var i = 0; i < widget.tabList.length; i++) 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.tabList[i]['id'].toString()),
                  Checkbox(value: widget.tabList[i]['enabled'], onChanged: (boolean){
                    setState(() {
                      widget.tabList[i]['enabled'] = boolean;
                    });
                  }),
                  Text(widget.tabList[i]['enabled'] ? 'Enabled' : 'Disabled'),
                  Expanded(
                    child: Container(
                      height: 25,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        key: const Key('TransferButton'),
                        onPressed: (){
                          widget.gp.transferImage(widget.sourceTab, widget.tabList, i);
                          if(widget.tabList.isEmpty) Navigator.pop(consCtxt);
                        }, 
                        child: const Text('Transfer')
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: (){
                    widget.gp.setTabList(widget.sourceTab, widget.tabList);
                    Navigator.pop(context);
                  }, 
                  child: const Text('Done', style: TextStyle(fontSize: 21))
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}