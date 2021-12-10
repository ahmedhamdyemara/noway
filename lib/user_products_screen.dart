import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/products.dart';
import '/user_product_item.dart';
import '/app_drawer.dart';
import './edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);
    print('rebuilding...');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Products'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
            future: _refreshProducts(context),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : RefreshIndicator(
                        onRefresh: () => _refreshProducts(context),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Consumer<Products>(
                                builder: (ctx, productsData, _) => Container(
                                  height: 350,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: ListView.builder(
                                      itemCount: productsData.items.length,
                                      itemBuilder: (_, i) => Column(
                                        children: [
                                          UserProductItem(
                                            productsData.items[i].id,
                                            productsData.items[i].title,
                                            productsData.items[i].imageUrl,
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'steps for adding product',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 25),
                                      ),
                                      SizedBox(height: 4),
                                      Center(
                                        child: Text(
                                            'after adding all the data u will need to confirm the title , price , description and the main product pic url again ..... for the url u can download wikimedia commons app and upload ur pic then copy the pic url from the - view file page - from the top right three dots ..... then view it with ur browser -chrome- then click on ur pic then share and copy the url - the first option- then paste ur pic url in the desired slot in our app'),
                                      )
                                    ]),
                              ))
                            ]))));
  }
}
