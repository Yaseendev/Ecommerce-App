import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart' as intl;
import 'package:my_ecommerce/Account/blocs/account_bloc/account_bloc.dart';
import 'package:my_ecommerce/Product/data/models/product.dart';
import 'package:my_ecommerce/Shared/widgets/dialogs.dart';
import 'package:my_ecommerce/Utils/constants.dart';

class ProductHomeHCard extends StatelessWidget {
  final Product product;
  final VoidCallback openContainer;
  const ProductHomeHCard({
    super.key,
    required this.product,
    required this.openContainer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openContainer();
        // Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductScreen(
        //   product: product,
        // )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(
          width: 145,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: FadeInImage.assetNetwork(
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(
                        Images.PLACEHOLDER,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 135,
                      ),
                      placeholder: Images.PLACEHOLDER,
                      image: product.images.first,
                      fit: BoxFit.fill,
                      height: 135,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      //color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        minRating: 0.5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) {},
                        allowHalfRating: true,
                        ignoreGestures: true,
                        initialRating: product.rating,
                        itemSize: 14,
                      ),
                      Text(
                        ' (${product.rating})',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      text: intl.NumberFormat.simpleCurrency(name: 'EGP')
                              .format(product.salePrice == null
                                  ? product.price
                                  : product.salePrice)
                              .split('.00')
                              .first +
                          ' ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        if (product.salePrice != null)
                          TextSpan(
                            text: intl.NumberFormat.simpleCurrency(name: 'EGP')
                                .format(product.price)
                                .split('.00')
                                .first,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(
                      CircleBorder(),
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    if (context.read<AccountBloc>().state is AccountLoggedIn) {
                      // context.read<WishlistBloc>().add(isWishlisted
                      //     ? RemoveFromlist(product.id)
                      //     : AddToWishlist(product));
                    } else {
                      showLoginDialog(
                          context, 'add this item to your wishlist');
                    }
                  },
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
