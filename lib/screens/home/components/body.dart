import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) =>
                  ItemCard(product: products[index]),
            ),
          ),
        )
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;

  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          // For demo we use fixed height and width
          // Now we dont need them
          // height: 180,
          // width: 160,
          decoration: BoxDecoration(
            color: product.color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(product.image),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            product.title,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text(
          "\$234",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

// We need statefull widget for our categories
