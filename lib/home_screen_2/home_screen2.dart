///Vẽ UI
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appchat/chats_screen.dart';
import 'package:appchat/contacts_screen.dart';
import 'package:appchat/dot_widget.dart';
import 'package:appchat/home_screen_2/home_cubit.dart';
import 'package:appchat/more_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final PageController controller = PageController();
  late final HomeCubit _cubit;

  @override
  void initState() {
    _cubit = HomeCubit();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) {
          return previous.selectedIndex != current.selectedIndex;
        },
        builder: (context,state) {
          return Scaffold(
            body: PageView(
              controller: controller,
              children: const <Widget>[
                ListContactScreen(),
                ChatsScreen(),
                MoreScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/ic_contact.svg",
                  ),
                  activeIcon: const Column(
                    children: [
                      Text(
                        "Contacts",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F1828)),
                      ),
                      SizedBox(height: 8),
                      DotWidget(),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/ic_chat.svg",
                  ),
                  activeIcon: const Column(
                    children: [
                      Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F1828),
                        ),
                      ),
                      SizedBox(height: 8),
                      DotWidget(),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/ic_more.svg",
                  ),
                  activeIcon: const Column(
                    children: [
                      Text(
                        "More",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F1828)),
                      ),
                      SizedBox(height: 8),
                      DotWidget(),
                    ],
                  ),
                  label: '',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: state.selectedIndex,
              selectedItemColor: Colors.black,
              onTap: (index) {
                _cubit.changeTab(index);
                controller.jumpToPage(index);
              },
              elevation: 5,
            ),
          );
        }
      ),
    );
  }
}
