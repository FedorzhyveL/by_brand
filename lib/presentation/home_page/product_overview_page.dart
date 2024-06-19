import 'package:auto_route/auto_route.dart';
import 'package:by_brand/domain/models/product_model.dart';
import 'package:by_brand/presentation/cart_page/bloc/cart_bloc.dart';
import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:by_brand/presentation/main_screen/bloc/main_bloc.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class ProductOverViewPage extends StatefulWidget {
  const ProductOverViewPage({super.key});

  @override
  State<ProductOverViewPage> createState() => _ProductOverViewPageState();
}

class _ProductOverViewPageState extends State<ProductOverViewPage> {
  late final ScrollController _scrollController;
  final textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            final List<Product> products = state.maybeMap(
              loaded: (value) => value.products.where((product) {
                if (!(product.name?.toLowerCase().contains(textController.text.toLowerCase()) ?? false)) return false;
                if (!(product.description?.contains(textController.text) ?? false)) return false;
                for (var element in homeState.selectedCategoriesIds) {
                  if (!(product.categories?.map((e) => e?.id).toList().contains(element) ?? false)) {
                    return false;
                  }
                }
                return true;
              }).toList(),
              orElse: () => [],
            );
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Поиск товара',
                      ),
                    ),
                  ),
                ),
                state.maybeMap(
                  loaded: (value) => SliverToBoxAdapter(
                    child: Container(
                      height: 30,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListView.separated(
                        itemCount: value.categories.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: 4),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => context.read<HomeBloc>().add(
                                  SelectCategorieHomeEvent(
                                    categorie: value.categories[index],
                                  ),
                                ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: homeState.selectedCategoriesIds.contains(
                                  value.categories[index].id,
                                )
                                    ? Colors.purple[100]
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Text(
                                value.categories[index].name ?? '',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  orElse: () => SliverToBoxAdapter(
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        color: Colors.grey,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  sliver: SliverDynamicHeightGridView(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 2,
                    itemCount: state.map(
                      initial: (_) => 4,
                      loaded: (_) => products.length,
                    ),
                    builder: (context, index) {
                      return GestureDetector(
                        onTap: state.mapOrNull(
                          loaded: (_) => () => context.router.push(
                                ProductDetailRoute(
                                  product: products[index],
                                ),
                              ),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).width * 0.9,
                                    width: MediaQuery.sizeOf(context).width * 0.45,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey,
                                      child: const ColoredBox(
                                        color: Colors.grey,
                                      ),
                                    ),
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
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  state.maybeMap(
                                    loaded: (value) => Text(
                                      products[index].name ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    orElse: () => Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey,
                                      child: const Text('Название товара'),
                                    ),
                                  ),
                                  state.maybeMap(
                                    loaded: (value) => Text(
                                      'от ${products[index].price} р.',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    orElse: () => Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey,
                                      child: const Text('от 99 р.'),
                                    ),
                                  ),
                                  state.maybeMap(
                                    loaded: (value) => Text(
                                      products[index].name ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    orElse: () => Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey,
                                      child: const Text('Название товара'),
                                    ),
                                  ),
                                  state.maybeMap(
                                    loaded: (value) => Text(
                                      products[index].categories?.map((e) => e?.name).toList().join(', ') ?? '',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    orElse: () => Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey,
                                      child: const Text('Категории'),
                                    ),
                                  ),
                                  state.maybeMap(
                                    loaded: (value) => Text(
                                      products[index].description ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    orElse: () => Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey,
                                      child: const Text('Описание товара'),
                                    ),
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
                                                  text: '10 отзывов',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  InkWell(
                                    onTap: products.isNotEmpty
                                        ? () => context.read<CartBloc>().add(
                                              CartEvent.addProduct(
                                                products[index],
                                              ),
                                            )
                                        : null,
                                    child: Container(
                                      width: double.infinity,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'В корзину',
                                        ),
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
          },
        );
      },
    );
  }
}
