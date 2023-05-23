import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/Account/blocs/account_bloc/account_bloc.dart';
import 'package:my_ecommerce/Utils/constants.dart';
import 'package:sizer/sizer.dart';
import '../widgets/user_inf0_items.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 25,
                left: 8,
                right: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Images.DEFAULT_PROFILE,
                      width: 90.sp,
                      height: 90.sp,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                  ),
                  SizedBox(height: 10),
                  state is AccountLoggedIn
                      ? Text(
                          state.user.name.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : TextButton.icon(
                          icon: const Icon(Icons.login),
                          label: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => LoginScreen()));
                          },
                        ),
                  state is AccountLoggedIn
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            UserInfoItems(),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 20),
                  //AccountScreenItems(),
                  SizedBox(height: 20),
                  state is AccountLoggedIn
                      ? Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.PRIMARY_COLOR,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(pi),
                                child: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            title: Text('Log Out'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
