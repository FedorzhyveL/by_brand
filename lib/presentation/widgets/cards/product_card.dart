import 'package:by_brand/data/models/product.dart';
import 'package:by_brand/presentation/home/bloc/home_bloc.dart';
import 'package:by_brand/presentation/widgets/cards/categorie_card.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, this.product, required this.bloc});
  final Product? product;
  final HomeBloc bloc;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late TextEditingController sellerIdController;
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController quantityController;
  late TextEditingController saleController;
  @override
  void initState() {
    super.initState();
    sellerIdController = TextEditingController.fromValue(
      TextEditingValue(text: widget.product?.seller_id.toString() ?? ''),
    );

    nameController = TextEditingController.fromValue(
      TextEditingValue(text: widget.product?.name ?? ''),
    );
    descriptionController = TextEditingController.fromValue(
      TextEditingValue(text: widget.product?.description ?? ''),
    );
    priceController = TextEditingController.fromValue(
      TextEditingValue(text: widget.product?.price.toString() ?? ''),
    );
    quantityController = TextEditingController.fromValue(
      TextEditingValue(text: widget.product?.quantity.toString() ?? ''),
    );
    saleController = TextEditingController.fromValue(
      TextEditingValue(text: widget.product?.sale.toString() ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Product:'),
                      if (widget.product != null) Text('id: ${widget.product?.id}'),
                      TextField(
                        controller: sellerIdController,
                        decoration: const InputDecoration(labelText: 'sellerId:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'name:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(labelText: 'description:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: priceController,
                        decoration: const InputDecoration(labelText: 'price:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: quantityController,
                        decoration: const InputDecoration(labelText: 'quantity:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: saleController,
                        decoration: const InputDecoration(labelText: 'sale:'),
                        maxLines: null,
                      ),
                      if (widget.product != null) const Text('categories:'),
                      if (widget.product != null)
                        ...List.generate(
                          widget.product?.categories?.length ?? 0,
                          (index) => CategorieCard(
                            categorie: widget.product?.categories?[index],
                            bloc: widget.bloc,
                          ),
                        ),
                    ],
                  ),
                ),
                if (widget.product != null) ...[
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                EditDataEvent(
                                  id: widget.product?.id,
                                  table: DataBaseTables.addresses,
                                  data: widget.product
                                      ?.copyWith(
                                        seller_id: int.tryParse(sellerIdController.text),
                                        name: nameController.text,
                                        description: descriptionController.text,
                                        price: int.tryParse(priceController.text),
                                        quantity: int.tryParse(quantityController.text),
                                        sale: int.tryParse(saleController.text),
                                      )
                                      .toJson(),
                                ),
                              ),
                      icon: const Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                DeleteDataEvent(
                                  id: widget.product?.id,
                                  table: DataBaseTables.products,
                                ),
                              ),
                      icon: const Icon(Icons.delete_rounded))
                ],
              ],
            ),
            if (widget.product == null)
              IconButton(
                onPressed: () {
                  widget.bloc.add(
                    AddDataToTableEvent(
                      data: Product(
                        name: nameController.text,
                        description: descriptionController.text,
                        seller_id: int.tryParse(sellerIdController.text),
                        price: int.tryParse(priceController.text),
                        quantity: int.tryParse(quantityController.text),
                        sale: int.tryParse(saleController.text),
                      ).toJson(),
                    ),
                  );
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.add_outlined,
                  color: Colors.green,
                  size: 40,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
