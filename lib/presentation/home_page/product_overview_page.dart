import 'package:auto_route/auto_route.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductOverViewPage extends StatefulWidget {
  const ProductOverViewPage({super.key});

  @override
  State<ProductOverViewPage> createState() => _ProductOverViewPageState();
}

class _ProductOverViewPageState extends State<ProductOverViewPage> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          sliver: SliverDynamicHeightGridView(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 2,
            itemCount: 10,
            builder: (context, index) {
              return GestureDetector(
                onTap: () => context.router.push(const ProductDetailRoute()),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: 'https://i.pinimg.com/564x/2c/8e/98/2c8e981280d108b806c2e07bfbcc15b9.jpg',
                          ),
                          const Positioned(
                            right: 8,
                            top: 8,
                            child: Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const Positioned(
                            left: 8,
                            top: 8,
                            child: Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.only(right: 4, left: 8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                color: Colors.purple[50],
                              ),
                              child: Text(
                                '- 100%',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red[600],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            overflow: TextOverflow.fade,
                            text: const TextSpan(
                              text: 'from 9,99\$',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'from 19,99\$',
                                  style: TextStyle(
                                      overflow: TextOverflow.clip,
                                      fontSize: 14,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const Text('Seller name'),
                          const Text(
                            'Description long',
                            overflow: TextOverflow.clip,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Colors.yellow[800],
                                size: 24,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '4,9',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '・',
                                      style: TextStyle(color: Colors.grey),
                                      children: [
                                        TextSpan(
                                          text: '10 reviews',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'order',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
