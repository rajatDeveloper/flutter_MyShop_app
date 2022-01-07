import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_shop/core/store.dart';
import 'package:my_shop/models/cart.dart';
import 'package:my_shop/models/data.dart';
import 'package:my_shop/pages/home_detail.dart';
import 'package:my_shop/utils/routes.dart';
import 'package:my_shop/widgets/drawer.dart';
import 'package:my_shop/widgets/item_widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catlogJson = await rootBundle.loadString("assets/files/catalog.json");
    final deCodeData = jsonDecode(catlogJson);
    var productdata = deCodeData["products"];
    CatalogModel.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation, AddMutation]);
    // final dumpList = List.generate(100, (index) => CatalogModel.items[0]);
    final _cart = (VxState.store as MyStore).cart; // assccesing the cart model
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.canvasColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 30,
            color: context.theme.cardColor,
          ),
        ).badge(
            color: context.theme.cardColor,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            size: 23,
            count: _cart.items.length),
        appBar: AppBar(
          title: Text("MyShop"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                // ? ListView.builder(
                //     // itemCount: CatalogModel.items.length,
                //     itemCount: CatalogModel.items.length,
                //     itemBuilder: (context, index) {
                //       return ItemWidget(
                //         item: CatalogModel.items[index],
                //       );
                //     },
                //   )
                ? GridView.builder(
                    itemCount: CatalogModel.items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 18),
                    itemBuilder: (context, index) {
                      // final item = CatalogModel.items[index];
                      final item = CatalogModel.items[index];
                      return Card(
                        color: context.theme.cardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        shadowColor: context.theme.buttonColor,
                        child: InkWell(
                          onTap: () {
                            //important part
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeDetailPage(item: item)));
                          },
                          child: GridTile(
                              header: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: context.theme.cardColor,
                                  ),
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                        color: context.theme.canvasColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                              footer: Container(
                                  color: Colors.white,
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Rs${item.price.toString()}",
                                        style: TextStyle(
                                            // ignore: deprecated_member_use
                                            color: context.theme.cardColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // ElevatedButton(
                                      //     onPressed: () {},
                                      //     child: Text(
                                      //       "Buy",
                                      //       textDirection: TextDirection.rtl,
                                      //     ))
                                    ],
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(34),
                                child: Hero(
                                  tag: Key(item.id.toString()),
                                  child: Image.asset(
                                    item.image,
                                  ),
                                ),
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
        drawer: MyDrawer());
  }
}
