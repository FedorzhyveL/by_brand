import 'package:by_brand/domain/models/user.dart';
import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:by_brand/presentation/widgets/cards/address_card.dart';
import 'package:by_brand/presentation/widgets/cards/role_card.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, this.user, required this.bloc});
  final User? user;
  final HomeBloc bloc;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController.fromValue(
      TextEditingValue(text: widget.user?.username ?? ''),
    );
    emailController = TextEditingController.fromValue(
      TextEditingValue(text: widget.user?.email ?? ''),
    );
    passwordController = TextEditingController.fromValue(
      TextEditingValue(text: widget.user?.password ?? ''),
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
                      const Text('User:'),
                      if (widget.user != null) Text('id: ${widget.user?.id}'),
                      TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(labelText: 'username:'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'email:'),
                        maxLines: null,
                      ),
                      if (widget.user != null) Text('emailVerifiedAt: ${widget.user?.email_verified_at}'),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(labelText: 'password:'),
                        maxLines: null,
                      ),
                      if (widget.user != null) ...[
                        Text('avatar: ${widget.user?.avatar}'),
                        Text('rememberToken: ${widget.user?.remember_token}'),
                        const Text('role: '),
                        RoleCard(role: widget.user?.role, bloc: widget.bloc),
                        const Text('addresses: '),
                        ...List.generate(
                          widget.user?.addresses?.length ?? 0,
                          (index) => AddressCard(
                            address: widget.user?.addresses?[index],
                            bloc: widget.bloc,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                if (widget.user != null) ...[
                  IconButton(
                    onPressed: null,
                    icon: const Icon(Icons.edit_rounded),
                  ),
                  IconButton(onPressed: null, icon: const Icon(Icons.delete_rounded))
                ],
              ],
            ),
            if (widget.user == null)
              IconButton(
                onPressed: () {
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
