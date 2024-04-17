import 'package:by_brand/data/models/categorie.dart';
import 'package:by_brand/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class CategorieCard extends StatefulWidget {
  const CategorieCard({super.key, this.categorie, required this.bloc});
  final Categorie? categorie;
  final HomeBloc bloc;

  @override
  State<CategorieCard> createState() => _CategorieCardState();
}

class _CategorieCardState extends State<CategorieCard> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController.fromValue(
      TextEditingValue(text: widget.categorie?.name ?? ''),
    );
    descriptionController = TextEditingController.fromValue(
      TextEditingValue(text: widget.categorie?.description ?? ''),
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
                      const Text('Categorie:'),
                      if (widget.categorie != null) Text('id: ${widget.categorie?.id}'),
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
                    ],
                  ),
                ),
                if (widget.categorie != null) ...[
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                EditDataEvent(
                                  id: widget.categorie?.id,
                                  table: DataBaseTables.addresses,
                                  data: widget.categorie
                                      ?.copyWith(
                                        name: nameController.text,
                                        description: descriptionController.text,
                                      )
                                      .toJson(),
                                ),
                              ),
                      icon: const Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc
                              .add(DeleteDataEvent(id: widget.categorie?.id, table: DataBaseTables.categories)),
                      icon: const Icon(Icons.delete_rounded))
                ],
              ],
            ),
            if (widget.categorie == null)
              IconButton(
                onPressed: () {
                  widget.bloc.add(
                    AddDataToTableEvent(
                      data: Categorie(
                        name: nameController.text,
                        description: descriptionController.text,
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
