import 'package:flutter/material.dart';
import 'package:my_shop/core/store.dart';
import 'package:my_shop/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title: const Text("MyShop - Cart"),
      ),
      body: Column(
        children: [
          _CartList().py24().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _cart = CartModel();
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "Rs${_cart.totalPrice}"
              .text
              .xl4
              .color(context.theme.cardColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.cardColor),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            "This service is in processing ; Soon it will be in working \nHence Placing order is not working yet."
                                .text
                                .make()));
                  },
                  child: "Place Order".text.make())
              .px12()
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
//   _CartList({Key? key}) : super(key: key);

//   @override
//   __CartListState createState() => __CartListState();
// }

// class __CartListState extends State<_CartList> {
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Noting to show ".text.xl4.color(context.cardColor).makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Image.asset(_cart.items[index].image).h(50),
              trailing: IconButton(
                  // color: Colors.yellow,
                  onPressed: () {
                    // _cart.remove(_cart.items[index]);
                    //   setState(() {});
                    //
                    RemoveMutation(_cart.items[index]);
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                  )),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.done),
                  _cart.items[index].name.text.xl2
                      .color(context.theme.cardColor)
                      .make(),
                ],
              ),
            ),
          );
  }
}
