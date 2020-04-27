import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/application.dart';
import 'package:flutter_demo/pages/test_page/simple_app_bar.dart';
import 'package:flutter_demo/pages/test_page/default_tab_app_bar.dart';



class TestPage extends StatefulWidget {

  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

//  Widget build(BuildContext context) {
//    // TODO: implement build
//    print('zhousuhua ------ _TestPageState context'+context.toString());
//
//    List<String> list = ['2个类分工','Scaffold Sample Apps'];
//    return yuesuWidget();
//  }
  Widget build(BuildContext context) {

    Widget titleSection = new Container(

      color: Colors.yellow,
//      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
//          new Expanded(
//            child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                new Container(
//                  padding: const EdgeInsets.only(bottom: 8.0),
//                  child: new Text(
//                    'Oeschinen Lake Campground',
//                    style: new TextStyle(
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
//                new Text(
//                  'Kandersteg, Switzerland',
//                  style: new TextStyle(
//                    color: Colors.grey[500],
//                  ),
//                ),
//              ],
//            ),
//          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    //...

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return ListView(
      children: [
        new Image.asset(
          'images/lake.jpg',
          width: 600.0,
          height: 240.0,
          fit: BoxFit.cover, // BoxFit.cover 告诉框架，图像应该尽可能小，但覆盖整个渲染框
        ),
        titleSection,
        buttonSection,
        textSection,
      ],
    );
  }

}


// 约束

class yuesuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    //...
  }
}



class TwoScrollPage extends StatefulWidget {

  _TwoScrollPageState createState() => _TwoScrollPageState();
}

class _TwoScrollPageState extends State<TwoScrollPage> {

  Widget build(BuildContext context) {
    // TODO: implement build
    print('zhousuhua ------ _TestPageState context'+context.toString());

    List<Widget> widgetList = [

      ShoppingList(
        products: <Product>[
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ],
      ),
    ];
    return ListView.builder(

      scrollDirection:  Axis.horizontal,
      itemCount: widgetList.length,
      itemBuilder: (context,index){
        Widget widget = widgetList[index];
        return widget;
      },
    );
  }
}



class Product {

  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
  : product = product,
  super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {

    return inCart ? Colors.black54: Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {

    if(!inCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {

    print('zhousuhua ------ ShoppingListItem context'+context.toString());
    // TODO: implement build
    return ListTile(
      onTap: (){
        onCartChanged(product, !inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }


}

class ShoppingList extends StatefulWidget {

  ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;

  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {

    setState(() {
      if(inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  Widget build(BuildContext context) {

    print('zhousuhua ------ context'+context.toString());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('shopping list'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      )
    );
  }

  @override
  void didUpdateWidget(ShoppingList oldWidget) {
    // TODO: implement didUpdateWidget

    print('zhousuhua ===== didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }
}
