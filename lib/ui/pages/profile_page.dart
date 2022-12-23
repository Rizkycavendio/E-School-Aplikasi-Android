import 'package:e_school/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //? HEADER
    Widget header() {
      return Container(
          height: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [kBlueSea, kBlueDeep],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            child: Center(
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: kWhiteTextStyleNotoSans.copyWith(
                    fontSize: 24, fontWeight: bold),
              ),
            ),
          ));
    }

    //? BUTTON SIGN-OUT
    Widget signOutButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: EdgeInsets.only(top: 18),
            width: 336,
            height: 50,
            child: TextButton(
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              style: TextButton.styleFrom(
                  backgroundColor: kBluePrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                'Sign Out',
                style: kWhiteTextStyleRoboto.copyWith(
                    fontSize: 20, fontWeight: bold),
              ),
            ),
          );
        },
      );
    }

    //? Profile Image
    Widget profileImage() {
      return Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: kBlueGridColor, width: 5),
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/akun.png'))),
      );
    }

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          header(),
                          profileImage(),
                          Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, right: 10, left: 10),
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: Icon(Icons.person),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: Text('${state.user.name}'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          //?Text 2
                          Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, right: 10, left: 10),
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: Icon(Icons.email),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: Text('${state.user.email}'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          //? text 3
                          Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, right: 10, left: 10),
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: Icon(Icons.school),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child:
                                              Text('NISN: ${state.user.nisn}'),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                          //? Text4
                          Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, right: 10, left: 10),
                              child: Material(
                                elevation: 4,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: Icon(Icons.remove_red_eye),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: Text('Password'),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Icon(Icons.autorenew),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              )),
                          signOutButton()
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
