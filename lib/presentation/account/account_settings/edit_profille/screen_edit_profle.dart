import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

import '../../../../application/EditProfile/edit_profile_bloc.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final name_controller = TextEditingController();
  final number_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: justgreen),
        ),
      ),
      body: BlocBuilder<EditProfileBloc, EditProfileState>(
        builder: (context, state) {
          return ListView(children: [
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<EditProfileBloc>(context).add(ProfilePic());
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 91,
                        backgroundColor: Colors.white60,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage: NetworkImage(
                            state.profile.profilePic,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            height_20,
            height_20,
            textfield('Name', name_controller),
            height_20,
            height_20,
            height_20,
            height_20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<EditProfileBloc>(context).add(
                      SaveProfie(name: name_controller.text.trim(), number: []),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white24),
                  child: const Text('  Save  '),
                ),
              ],
            )
          ]);
        },
      ),
    );
  }

  Row textfield(String hint, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,

            style: const TextStyle(color: Colors.white, fontSize: 16),
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: (value) =>
            //     value != null && value.length <= 3 ? 'min 3 char' : null,
            decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: razergreen, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.white70)),
          ),
        ),
      ],
    );
  }
}
