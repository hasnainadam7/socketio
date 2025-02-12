import 'package:flutter/material.dart';

import '../../data/models/users_models.dart';
import '../../utils/colors.dart';
import '../../widgets/circular_container.dart';
import '../../widgets/texts/poppins.dart';

final List<UsersModel> users = [
  UsersModel(
    id: '1',
    username: 'ads',
    email: 'dasdasd',
    fullname: 'Athalia Putri',
    avatar: 'assets/images/dp1.png',
    coverImage: '',
    role: '',
    watchHistory: [],

  ),
  UsersModel(
    id: '1',
    username: 'ads',
    email: 'dasdasd',
    fullname: 'Athalia Putri',
    avatar: 'assets/images/dp1.png',
    coverImage: '',
    role: '',
    watchHistory: [],

  ),  UsersModel(
    id: '1',
    username: 'ads',
    email: 'dasdasd',
    fullname: 'Athalia Putri',
    avatar: 'assets/images/dp1.png',
    coverImage: '',
    role: '',
    watchHistory: [],

  ),  UsersModel(
    id: '1',
    username: 'ads',
    email: 'dasdasd',
    fullname: 'Athalia Putri',
    avatar: 'assets/images/dp1.png',
    coverImage: '',
    role: '',
    watchHistory: [],

  ),  UsersModel(
    id: '1',
    username: 'ads',
    email: 'dasdasd',
    fullname: 'Athalia Putri',
    avatar: 'assets/images/dp1.png',
    coverImage: '',
    role: '',
    watchHistory: [],

  ),
];

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircularContainer(
                        child: Image.asset(
                          user.avatar,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      if (true)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Poppins(
                        label: user.fullname,
                        size: 18,
                      ),
                      Poppins(
                        label: user.username,
                        size: 12,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: AppColors.greyColor,
                thickness: 0.5,
              )
            ],
          ),
        );
      },
    );
  }
}
