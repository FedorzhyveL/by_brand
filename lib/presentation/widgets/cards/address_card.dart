import 'package:by_brand/data/models/address.dart';
import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({super.key, this.address, required this.bloc});
  final Address? address;
  final HomeBloc bloc;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  late TextEditingController userIdController;
  late TextEditingController streetController;
  late TextEditingController cityController;
  late TextEditingController apartmentController;
  late TextEditingController zipCodeController;
  late TextEditingController countryController;
  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController.fromValue(
      TextEditingValue(text: widget.address?.user_id.toString() ?? ''),
    );
    streetController = TextEditingController.fromValue(
      TextEditingValue(text: widget.address?.street ?? ''),
    );
    cityController = TextEditingController.fromValue(
      TextEditingValue(text: widget.address?.city ?? ''),
    );
    apartmentController = TextEditingController.fromValue(
      TextEditingValue(text: widget.address?.apartment ?? ''),
    );
    zipCodeController = TextEditingController.fromValue(
      TextEditingValue(text: widget.address?.zipcode.toString() ?? ''),
    );
    countryController = TextEditingController.fromValue(
      TextEditingValue(text: widget.address?.country ?? ''),
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
                      const Text('Address:'),
                      if (widget.address != null) Text('id: ${widget.address?.id}'),
                      TextField(
                        controller: userIdController,
                        decoration: const InputDecoration(labelText: 'userId:'),
                        maxLines: null,
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: streetController,
                        decoration: const InputDecoration(labelText: 'street:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: cityController,
                        decoration: const InputDecoration(labelText: 'city:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: apartmentController,
                        decoration: const InputDecoration(labelText: 'apartment:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: zipCodeController,
                        decoration: const InputDecoration(labelText: 'zipcode:'),
                        maxLines: null,
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: countryController,
                        decoration: const InputDecoration(labelText: 'country:'),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
                if (widget.address != null) ...[
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                EditDataEvent(
                                  id: widget.address?.id,
                                  table: DataBaseTables.addresses,
                                  data: widget.address
                                      ?.copyWith(
                                        user_id: int.tryParse(userIdController.text),
                                        street: streetController.text,
                                        apartment: apartmentController.text,
                                        city: cityController.text,
                                        zipcode: int.tryParse(zipCodeController.text),
                                        country: countryController.text,
                                      )
                                      .toJson(),
                                ),
                              ),
                      icon: const Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () =>
                              widget.bloc.add(DeleteDataEvent(id: widget.address?.id, table: DataBaseTables.addresses)),
                      icon: const Icon(Icons.delete_rounded)),
                ],
              ],
            ),
            if (widget.address == null)
              IconButton(
                onPressed: () {
                  widget.bloc.add(
                    AddDataToTableEvent(
                      data: Address(
                        user_id: int.tryParse(userIdController.text),
                        street: streetController.text,
                        city: cityController.text,
                        apartment: apartmentController.text,
                        zipcode: int.tryParse(zipCodeController.text),
                        country: countryController.text,
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
