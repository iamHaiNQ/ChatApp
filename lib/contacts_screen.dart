import 'package:flutter/material.dart';

class ListContactScreen extends StatefulWidget {
  const ListContactScreen({Key? key}) : super(key: key);

  @override
  State<ListContactScreen> createState() => _ListContactScreenState();
}

class _ListContactScreenState extends State<ListContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: ListView.separated(
        itemCount: users.length,
        padding: const EdgeInsets.only(
          top: 16,
        ),
        separatorBuilder: (context, index) {
          return Container(
            color: Color(0xFFEDEDED),
            height: 1,
            margin: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
          );
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 4,
              left: 24,
              right: 24,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: Center(
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage("${users[index].avatar}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text("${users[index].userName}"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
ListView: đưa các phần tử con có cấu trúc khác nhau vào và có thể cuộn được
ListView.builder: gen ra 1 danh sách các phần tử giống nhau
ListView.separated: gen ra 1 danh sách các phần tử giống nhau và có thể setting thêm khoảng cách ở giữa các phần tử
*/

class UserEntity {
  final String? avatar;
  final String? userName;
  final String? status;

  UserEntity({
    this.status,
    this.avatar,
    this.userName,
  });
}

List<UserEntity> users = [
  UserEntity(
    avatar:
        "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
    userName: "Athalia Putri",
    status: "Last seen yesterday",
  ),
  UserEntity(
    avatar:
        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXZhdGFyfGVufDB8fDB8fHww&w=1000&q=80",
    userName: "Erlan Sadewa",
    status: "Online",
  ),
  UserEntity(
    avatar:
        "https://imgv3.fotor.com/images/gallery/watercolor-female-avatar.jpg",
    userName: "Midala Huera",
    status: "Last seen 3 hours ago",
  ),
];
