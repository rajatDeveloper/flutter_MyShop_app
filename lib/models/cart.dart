import 'package:my_shop/core/store.dart';
import 'package:my_shop/models/data.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //singletion class
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;

  // ignore: unused_field
  late CatalogModel _catalog;
  //all id will stored here
  final List<int> _itemIds = [];
  // get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Getting items in cart using ids
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //geting the totle price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
