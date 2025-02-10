import 'package:flutter/material.dart';


import '../../data/models/users_models.dart';
import '../../utils/colors.dart';
import '../../widgets/circular_container.dart';
import '../../widgets/texts/poppins.dart';

final List<User> users = [
  User(
    name: "Athalia Putri",
    status: "Last seen yesterday",
    imagePath: "assets/images/dp1.png",
    isOnline: false,
  ),
  User(
    name: "Erlan Sadewa",
    status: "Online",
    imagePath: "assets/images/dp2.png",
    isOnline: true,
  ),
  User(
    name: "Midala Huera",
    status: "Last seen 3 hours ago",
    imagePath: "assets/images/dp3.png",
    isOnline: false,
  ),
  User(
    name: "Nafisa Gitari",
    status: "Online",
    imagePath: "assets/images/dp4.png",
    isOnline: true,
  ),
  User(
    name: "Raki Devon",
    status: "Online",
    imagePath: "assets/images/dp5.png",
    isOnline: true,
  ),
  User(
    name: "Salsabila Akira",
    status: "Last seen 30 minutes ago",
    imagePath: "assets/images/dp6.png",
    isOnline: false,
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
                          user.imagePath,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      if (user.isOnline)
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
                        label: user.name,
                        size: 18,
                      ),
                      Poppins(
                        label: user.status,
                        size: 12,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),

                ],
              ),
              const Divider(color: AppColors.greyColor,thickness: 0.5,)
            ],
          ),
        );
      },
    );
  }
}
