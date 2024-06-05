import 'package:by_brand/domain/models/review.dart';
import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, this.review, required this.bloc});
  final Review? review;
  final HomeBloc bloc;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  late TextEditingController reviewerIdController;
  late TextEditingController productIdController;
  late TextEditingController ratingController;
  @override
  void initState() {
    super.initState();
    reviewerIdController = TextEditingController.fromValue(
      TextEditingValue(text: widget.review?.reviewer_id.toString() ?? ''),
    );
    productIdController = TextEditingController.fromValue(
      TextEditingValue(text: widget.review?.product_id.toString() ?? ''),
    );

    ratingController = TextEditingController.fromValue(
      TextEditingValue(text: widget.review?.rating.toString() ?? ''),
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
                      const Text('Review:'),
                      if (widget.review != null) Text('id: ${widget.review?.id}'),
                      TextField(
                        controller: reviewerIdController,
                        decoration: const InputDecoration(labelText: 'reviewerId:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: productIdController,
                        decoration: const InputDecoration(labelText: 'productId:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: ratingController,
                        decoration: const InputDecoration(labelText: 'rating:'),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
                if (widget.review != null) ...[
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                EditDataEvent(
                                  id: widget.review?.id,
                                  table: DataBaseTables.addresses,
                                  data: widget.review
                                      ?.copyWith(
                                        reviewer_id: int.tryParse(reviewerIdController.text),
                                        product_id: int.tryParse(productIdController.text),
                                        rating: int.tryParse(ratingController.text),
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
                                  id: widget.review?.id,
                                  table: DataBaseTables.reviews,
                                ),
                              ),
                      icon: const Icon(Icons.delete_rounded))
                ],
              ],
            ),
            if (widget.review == null)
              IconButton(
                onPressed: () {
                  widget.bloc.add(
                    AddDataToTableEvent(
                      data: Review(
                        reviewer_id: int.tryParse(reviewerIdController.text),
                        product_id: int.tryParse(productIdController.text),
                        rating: int.tryParse(ratingController.text),
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
