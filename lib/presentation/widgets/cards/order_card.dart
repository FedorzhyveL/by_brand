import 'package:by_brand/domain/models/order.dart';
import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, this.order, required this.bloc});
  final Order? order;
  final HomeBloc bloc;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late TextEditingController userIdController;
  late TextEditingController statusController;
  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController.fromValue(
      TextEditingValue(text: widget.order?.user_id.toString() ?? ''),
    );
    statusController = TextEditingController.fromValue(
      TextEditingValue(text: widget.order?.status ?? ''),
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
                      const Text('Order:'),
                      if (widget.order != null) Text('id: ${widget.order?.id}'),
                      TextField(
                        controller: userIdController,
                        decoration: const InputDecoration(labelText: 'userId:'),
                        maxLines: null,
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: statusController,
                        decoration: const InputDecoration(labelText: 'status:'),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
                if (widget.order != null) ...[
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                EditDataEvent(
                                  id: widget.order?.id,
                                  table: DataBaseTables.addresses,
                                  data: widget.order
                                      ?.copyWith(
                                        status: statusController.text,
                                        id: int.tryParse(userIdController.text),
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
                                id: widget.order?.id,
                                table: DataBaseTables.orders,
                              ),
                            ),
                    icon: const Icon(Icons.delete_rounded),
                  ),
                ],
              ],
            ),
            if (widget.order == null)
              IconButton(
                onPressed: () {
                  widget.bloc.add(
                    AddDataToTableEvent(
                      data: Order(
                        user_id: int.tryParse(userIdController.text),
                        status: statusController.text,
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
