import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:message_app/models/list_pager.dart';
import 'package:message_app/models/list_vo.dart';

import 'contactor_item.dart';
import 'contactor_model.dart';
import 'impl/contactor_service_impl.dart';

class ContactorList extends StatefulWidget {
  ContactorList({Key key}) : super(key: key);

  @override
  _ContactorListState createState() => _ContactorListState();
}

//ToDo：数据要通过状态管理器管理，否则每次都会创建，导致每次都会刷新
class _ContactorListState extends State<ContactorList> {
  List<ContactorModel> contactorData;
  ListPager pager;
  bool _isLoaded = false;

  EasyRefreshController _controller = EasyRefreshController();
  String _indicatorText;

  @override
  void initState() {
    super.initState();
    _indicatorText = 'Loading...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        firstRefresh: !_isLoaded,
        //emptyWidget: Center(child:Text(_indicatorText)),
        controller: _controller,
        onRefresh: () async {
          ListVO<ContactorModel> newData =
              await ContactorServiceImpl.getSharedInstance()
                  .listContactor(1, 20);
          contactorData = newData?.listItems;
          pager = newData?.pager;
          await Future.delayed(Duration(seconds: 2), () {
            _controller.resetLoadState();

            if (pager == null || pager?.nextPage == pager?.currentPage) {
              _controller.finishLoad(noMore: true);
            }
          });
          _isLoaded = true;
            setState(() {
              if (pager.total == 0) {
                _indicatorText = 'No Data Available';
              }
            });
        },
        onLoad: () async {
          if (pager.nextPage > pager.currentPage) {
            ListVO<ContactorModel> newData =
                await ContactorServiceImpl.getSharedInstance()
                    .listContactor(pager.nextPage, pager.paegSize);
            contactorData.addAll(newData?.listItems);
            pager = newData.pager;

            await Future.delayed(Duration(seconds: 2), () {
              
              _controller.finishLoad(
                  noMore: pager.totalPage == pager.currentPage);
            });
            setState(() {});
          }
        },
        child: contactorData != null
            ? _getListView()
            : Center(
                child: Text(_indicatorText),
              ),
      ),
    );
  }

  ListView _getListView() {
    return ListView.builder(
        itemCount: contactorData.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: <Widget>[
                _getHeaderView(index),
                Offstage(
                  offstage: _shouldShowFirstCharSection(index),
                  child: _getFirstCharSection(index),
                ),
                ContactorItem(contactor: contactorData[index]),
              ],
            ),
          );
        });
  }

  Widget _getHeaderView(int index) {
    if (index != 0) return Container();

    return Offstage(
      offstage: false,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getHeaderRow('images/icon_adduser.png', '添加好友'),
            _getHeaderRow('images/icon_chat.png', '聊天室'),
          ],
        ),
      ),
    );
  }

  Widget _getHeaderRow(String iconPath, String name) {
    return Row(
      children: <Widget>[
        ClipOval(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Image.asset(
                iconPath,
                fit: BoxFit.fill,
                width: 20,
                height: 20,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF1296db),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              name,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  bool _shouldShowFirstCharSection(int index) {
    if (contactorData == null || contactorData.length < index) return true;
    if (index > 0 &&
        contactorData[index].firstChar == contactorData[index - 1].firstChar) {
      return true;
    }

    return false;
  }

  Widget _getFirstCharSection(int index) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        contactorData[index].firstChar,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF606060),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFdddddd))),
      ),
    );
  }
}
