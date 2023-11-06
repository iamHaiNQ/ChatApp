import 'package:flutter/material.dart';
import 'package:appchat/input_phone_number.dart';
import 'package:appchat/service/isar_service.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            ///1. Mở Isar service
            final isar = IsarService();

            ///2. Lấy về danh sách SDT đang lưu trong máy
            final listPhones = await isar.getAllPhoneNumbers();

            ///3. Kiểm tra nếu có SDT (đang đăng nhập) -> Xóa SDT đó (Đăng xuất)
            if (listPhones.isNotEmpty) {
              final result = await isar.deletePhoneNumber(listPhones[0]);
              ///4. Nếu đăng xuất thành công thì out ra màn hình login
              if (result) {
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const InputPhoneNumber(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
              }
            }
          },
          child: Container(
            margin: const EdgeInsets.only(
              top: 18,
              bottom: 20,
              left: 24,
              right: 24,
            ),
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF002ED3),
            ),
            child: const Center(
              child: Text(
                "Đăng xuất",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
