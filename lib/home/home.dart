import 'package:echange/home/bloc/home_bloc.dart';
import 'package:echange/menu/menu.dart';
import 'package:echange/utils/custom_app_bar.dart';
import 'package:echange/utils/list_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_bar.dart';
import '../utils/mock_clothes.dart' as mockData;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

// TODO: filter data from onTap or current value of dropdowns
class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var categoryValue;
  var sizeValue;
  var colorValue;
  var stateValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc()..add(RequestAllItems()),
        child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
          if (state is LoadingState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Cargando items"),
                ),
              );
          } else if (state is ErrorMessageState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("${state.errorMsg}"),
                ),
              );
          }
        }, builder: (context, state) {
          if (state is LoadedItemsState) {
            return Scaffold(
                key: _scaffoldKey,
                backgroundColor: Color.fromRGBO(242, 204, 143, 1),
                endDrawer: new Drawer(
                  child: Menu(),
                ),
                appBar: customAppBar,
                body: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    FilterBar(categoryValue, sizeValue, colorValue, stateValue),
                    RefreshIndicator(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: state.itemList.length,
                        itemBuilder: (context, index) {
                          return ListItemCard(
                            isOwn: true,
                            name: state.itemList[index].name,
                            description: state.itemList[index].description,
                            size: state.itemList[index].size,
                            state: state.itemList[index].state,
                            image: state.itemList[index].urlPicture,
                          );
                        },
                      ),
                      onRefresh: () async {
                        BlocProvider.of<HomeBloc>(context)
                            .add(RequestAllItems());
                      },
                    )
                  ],
                ));
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}
