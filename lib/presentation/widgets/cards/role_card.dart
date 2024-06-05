import 'package:by_brand/domain/models/role.dart';
import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class RoleCard extends StatefulWidget {
  const RoleCard({super.key, this.role, required this.bloc});
  final Role? role;
  final HomeBloc bloc;

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  late TextEditingController roleController;
  @override
  void initState() {
    roleController = TextEditingController.fromValue(
      TextEditingValue(text: widget.role?.role.toString() ?? ''),
    );
    super.initState();
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
                      const Text('Role:'),
                      if (widget.role != null) Text('id: ${widget.role?.id}'),
                      TextField(
                        controller: roleController,
                        decoration: const InputDecoration(labelText: 'role:'),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
                if (widget.role != null) ...[
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                EditDataEvent(
                                  id: widget.role?.id,
                                  table: DataBaseTables.addresses,
                                  data: widget.role?.copyWith(role: roleController.text).toJson(),
                                ),
                              ),
                      icon: const Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: widget.bloc.state.loading
                          ? null
                          : () => widget.bloc.add(
                                DeleteDataEvent(
                                  id: widget.role?.id,
                                  table: DataBaseTables.roles,
                                ),
                              ),
                      icon: const Icon(Icons.delete_rounded))
                ],
              ],
            ),
            if (widget.role == null)
              IconButton(
                onPressed: () {
                  widget.bloc.add(
                    AddDataToTableEvent(
                      data: Role(
                        role: roleController.text,
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
