// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/core/store.dart';
import 'package:my_shop/models/cart.dart';
import 'package:my_shop/models/data.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'velco';

class HomeDetailPage extends StatelessWidget {
  final Item item;
  const HomeDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyShop - ${item.name}")),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          Text(
            "Rs${item.price}",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: context.theme.cardColor),
            textScaleFactor: 1.5,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.cardColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        "This service is in processing ; Soon it will be in working \nHence buying is not working yet."
                            .text
                            .make()));
              },
              child: const Text(
                "Buy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )).wh(80, 40),
          _AddToCart(catalog: item).wh(80, 40),
        ],
      ).p12(),
      body: ListView(
        children: [
          Hero(
                  tag: Key(item.id.toString()),
                  child: Image.asset(item.image).h32(context))
              .p12(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              height: 380,
              color: Colors.black12,
              child: Column(
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                        fontSize: 33,
                        color: context.theme.cardColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    item.desc,
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.cardColor,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    "demo app as we are showing the fake data for app debugging demo app as we are showing the fake data for app debugging demo app as we are showing the fake data for app debugging ",
                    style:
                        TextStyle(fontSize: 14, color: context.theme.cardColor),
                  ),
                ],
              ).p64(),
            ),
          ))
        ],
      ),
    );
  }
}

class _AddToCart extends StatelessWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

//   @override
//   State<_AddToCart> createState() => _AddToCartState();
// }

// class _AddToCartState extends State<_AddToCart> {
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.cardColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          //cart button

          if (!isInCart) {
            // isInCart = isInCart.toggle();
            // final _catalog = CatalogModel();
            // _cart.catalog = _catalog;
            AddMutation(catalog);
            // _cart.add(catalog);
            // setState(() {});
          }
        },
        child:
            isInCart ? Icon(Icons.done) : Icon(Icons.shopping_cart_outlined));
  }
}
