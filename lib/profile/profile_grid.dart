import 'package:echange/menu/menu.dart';
import 'package:echange/newItem/item_form.dart';
import 'package:echange/profile/bloc/profile_bloc.dart';
import 'package:echange/utils/grid_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileGrid extends StatefulWidget {
  final String profileName;
  ProfileGrid({Key key, @required this.profileName}) : super(key: key);

  @override
  _ProfileGridState createState() => _ProfileGridState();
}

class _ProfileGridState extends State<ProfileGrid> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(RequestAllItems()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LoadingState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Cargando tus items..."),
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
        },
        builder: (context, state) {
          if (state is LoadedItemsState) {
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Color.fromRGBO(242, 204, 143, 1),
              endDrawer: new Drawer(
                child: Menu(),
              ),
              appBar: AppBar(
                leading: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset('assets/images/plant.png')),
                backgroundColor: Color.fromRGBO(129, 178, 154, 1.0),
              ),
              body: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 100,
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(181, 72, 219, .6),
                                child: Image.asset("assets/images/woman.png"),
                                minRadius: 50,
                                maxRadius: 80,
                              ),
                            ),
                            Text(
                              this.widget.profileName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Color.fromRGBO(61, 64, 91, 1),
                            ),
                            onPressed: () {
                              //TO-DO: Add new item
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ItemForm()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: RefreshIndicator(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 250,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20),
                          itemCount: state.itemList.length,
                          itemBuilder: (context, index) {
                            return GridItemCard(
                                ownerName: this.widget.profileName,
                                ownerPicture: "assets/images/woman.png",
                                name: state.itemList[index].name,
                                description: state.itemList[index].description,
                                size: state.itemList[index].size,
                                state: state.itemList[index].state,
                                image: state.itemList[index].urlPicture
                            );
                          },
                        ),
                        onRefresh: () async {
                          BlocProvider.of<ProfileBloc>(context)
                            .add(RequestAllItems());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
