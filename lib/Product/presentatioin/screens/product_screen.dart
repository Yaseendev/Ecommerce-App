import 'package:flutter/material.dart';
import 'package:my_ecommerce/Product/data/models/product.dart';
import 'package:my_ecommerce/Utils/constants.dart';
import '../widgets/loaded/product_header.dart';
import '../widgets/loaded/shipping_info_section.dart';
import '../widgets/product_image_section.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late final ScrollController _scrollController;
  int qty = 1;
  String selectedSize = 'M';
  //String selectedColor = ColorOption.black.name;
  bool get _isSliverAppBarCollapsed {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (MediaQuery.of(context).size.height * .35) - kToolbarHeight;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: _isSliverAppBarCollapsed
                  ? Text(
                      widget.product.name,
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    )
                  : null,
              leading: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    shape: MaterialStateProperty.all(
                      CircleBorder(),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFF5F5F5)),
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * .35,
              flexibleSpace: FlexibleSpaceBar(
                background: ProductImageSection(
                  product: widget.product,
                ),
              ),
            ),
          ],
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.transparent,
            ),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                ProductHeader(
                  product: widget.product,
                ),
                ShippingInfoSection(),
                const Divider(),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
