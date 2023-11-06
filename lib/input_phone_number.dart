import 'package:flutter/material.dart';
import 'package:appchat/home_screen_2/home_screen2.dart';
import 'package:appchat/models/phone_number.dart';
import 'package:appchat/models/phone_number_entity.dart';
import 'package:appchat/service/fire_storage_service.dart';
import 'package:appchat/service/isar_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({Key? key}) : super(key: key);

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.pop(context); //Chọn 1 trong 2
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  child: SvgPicture.asset(
                    "assets/vectors/ic_arrow_left.svg",
                  ),
                ),
              ),
              const SizedBox(height: 98),
              const Center(
                child: Text(
                  "Enter Your Phone Number",
                  style: TextStyle(
                    color: Color(0xFF0F1828),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  children: <Widget>[
                    /*Container(
                      height: 36,
                      width: 74,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.yellow, // Color(0xFFF7F7FC),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),*/

                    ///Bật bàn phím trên máy ảo: Ctrl + K
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7FC),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: TextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: Color(0xFFADB5BD),
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  /* ///Open Isar service
                  final isarService = IsarService();

                  ///Lấy về text mình vừa nhập xong
                  final newPhone = PhoneNumberEntity(
                    phoneNumber: phoneNumberController.text,
                  );

                  ///Save số điện thoại này vào local máy -> call hàm create
                  final result = await isarService.createPhoneNumber(newPhone);

                  ///Nếu lưu thành công thì vào màn HomeScreen
                  if (result) {
                    if (context.mounted) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen2(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }
                  }*/

                  try {
                    ///Open FireStorage Service
                    final fireStorageService = FireStorageService();

                    ///Lấy về text mình vừa nhập xong
                    final newPhone = PhoneNumber(
                      phone: phoneNumberController.text,
                    );

                    ///Save số điện thoại lên Firestorage
                    await fireStorageService.createPhoneNumber(newPhone);

                    ///Nếu lưu thành công thì vào màn HomeScreen
                    if (context.mounted) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen2(),
                        ),
                            (Route<dynamic> route) => false,
                      );
                    }
                  } catch (e) {
                    print("Loi them data");
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
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF002ED3),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
