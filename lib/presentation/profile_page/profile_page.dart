import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 24,
              top: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 48,
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 16),
                Text('Name'),
              ],
            ),
          ),
          Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                const ListElement(
                  headerText: 'Ваш пол',
                  title: 'Мужской',
                ),
                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 0.2,
                ),
                const ListElement(
                  headerText: 'Не указано',
                  title: 'Изменить email',
                ),
                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 0.2,
                ),
                const ListElement(
                  headerText: 'Цветовая тема',
                  title: 'Светлая',
                ),
                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 0.2,
                ),
                const ListElement(
                  headerText: 'Подтверждение заказов',
                  title: 'По коду, лицу или отпечатку',
                ),
                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 0.2,
                ),
                const ListElement(
                  headerText: 'Настройка уведомлений',
                ),
                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 0.2,
                ),
                const ListElement(
                  headerText: 'Мои реквизиты',
                ),
                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 0.2,
                ),
                ListElement(
                  headerText: 'Выйти из аккаунта',
                  headerTextStyle: TextStyle(color: Colors.red[400]),
                ),
                const Divider(
                  height: 0,
                  color: Colors.black,
                  thickness: 0.2,
                ),
                const ListElement(
                  headerText: 'Удалить личный кабинет',
                  headerTextStyle: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListElement extends StatelessWidget {
  const ListElement({
    super.key,
    required this.headerText,
    this.headerTextStyle,
    this.title,
  });
  final String headerText;
  final TextStyle? headerTextStyle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: title == null ? 10 : 2,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headerText,
                style: headerTextStyle,
              ),
              if (title != null)
                Text(
                  title!,
                  style: TextStyle(color: Colors.grey[700]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
