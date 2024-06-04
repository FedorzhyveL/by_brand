import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.grey[100],
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: Stack(
                    children: [
                      PageView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: CachedNetworkImage(
                              imageUrl: 'https://i.pinimg.com/564x/2c/8e/98/2c8e981280d108b806c2e07bfbcc15b9.jpg',
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: CachedNetworkImage(
                              imageUrl: 'https://i.pinimg.com/564x/0d/d4/94/0dd494d3fef5754409b0df24d9f055e8.jpg',
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://img.freepik.com/free-photo/stunning-square-portrait-adorable-cute-cat_181624-37290.jpg?t=st=1717158160~exp=1717161760~hmac=1cab70094d4601341be6de4fbdb87dd499a225fa21b18b33ff909c9635c152ec&w=740',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
