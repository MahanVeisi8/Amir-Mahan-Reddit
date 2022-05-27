import 'package:Amir_Mahan_Reddit/BasicClasses/Community.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/SavedPosts.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ThemeChoosing.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/ProfilePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/OnSidebar/AboutUs.dart';
import 'package:Amir_Mahan_Reddit/Screens/SettingPage.dart';
import 'package:Amir_Mahan_Reddit/Screens/HomePage.dart';
import 'package:Amir_Mahan_Reddit/Widgets/sideBarDrawer.dart';
import 'package:Amir_Mahan_Reddit/Widgets/SideBarButtonWidget.dart';
import 'package:Amir_Mahan_Reddit/Screens/WelcomePage.dart';
import 'package:Amir_Mahan_Reddit/Screens/SignLogIn.dart';


class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF1F2833),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/AlliSherlock.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
              Positioned(
                top: MediaQuery.of(context).size.height/2 * 0.8,
                left: MediaQuery.of(context).size.width/2 * 0.20,
                child:  Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.symmetric(
                      horizontal: 18,
                    vertical: 5
                  ),
                  child: Text(
                    'Sarah Absdsfsfsads',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF5F5F5),
                    ),
                  ),
                  ),
                ),
            SizedBox(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Container(
                color: Color(0xFF66FCF1),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    // backgroundColor: Color(0xFF1F2833),
                    // color: Color(0xFF1F2833),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.white,
                     color: Color(0xFF1F2833),
                      border: Border.all(
                        color: Color(0xFF66FCF1),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          // margin: EdgeInsets.only(left: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(0xFF66FCF1),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Username : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Alli Sherlock',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC5C6C7),
                                ),
                              ),
                              ],
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          // margin: EdgeInsets.only(left: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Color(0xFF66FCF1),
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Email : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'ali@gmail.com',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC5C6C7),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Posts',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),

                          ],
                        ),
                      ),
                    ]
                  ),
                ),
          ],
      // body: SizedBox(
      //   height: MediaQuery.of(context).size.height/2,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(30),
      //         bottomRight: Radius.circular(30),
      //       ),
      //       image: DecorationImage(
      //         image: AssetImage('assets/images/AlliSherlock.jpg'),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      // ),
    )
    )
  }
}











// class UserPage extends StatefulWidget {
//   static const String routeName = '/profile';
//
//   @override
//   State<UserPage> createState() => _UserPageState();
// }
//
// class _UserPageState extends State<UserPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: CustomAppBar(
//       //   title: 'PROFILE',
//       // ),
//       body: SingleChildScrollView(
//         child: BlocBuilder(
//           builder: (context, state) {
//             // if (state is ProfileInitial) {
//             //   return Center(
//             //     child: CircularProgressIndicator(),
//             //   );
//             // }
//             // if (state is ProfileLoaded) {
//               return Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Container(
//                     height: 200,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(100),
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/Alli.jpg'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   // UserImage.medium(
//                   //   url: state.user.imageUrls[0],
//                   //   child: Container(
//                   //     decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(15),
//                   //       gradient: LinearGradient(
//                   //         colors: [
//                   //           Theme.of(context).primaryColor.withOpacity(0.1),
//                   //           Theme.of(context).primaryColor.withOpacity(0.9),
//                   //         ],
//                   //         begin: Alignment.topCenter,
//                   //         end: Alignment.bottomCenter,
//                   //       ),
//                   //     ),
//                   //     child: Align(
//                   //       alignment: Alignment.bottomCenter,
//                   //       child: Padding(
//                   //         padding: const EdgeInsets.only(bottom: 40.0),
//                   //         child: Text(
//                   //           state.user.name,
//                   //           style: Theme.of(context)
//                   //               .textTheme
//                   //               .headline1
//                   //               .copyWith(color: Colors.white),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TitleWithIcon(title: 'Biography', icon: Icons.edit),
//                         Text(
//                           state.user.bio,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1
//                               .copyWith(height: 1.5),
//                         ),
//                         TitleWithIcon(title: 'Pictures', icon: Icons.edit),
//                         Container(
//                           margin: const EdgeInsets.symmetric(vertical: 10),
//                           height: state.user.imageUrls.length > 0 ? 125 : 0,
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: state.user.imageUrls.length,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(right: 5.0),
//                                 // child: UserImage.small(
//                                 //   width: 100,
//                                 //   url: state.user.imageUrls[index],
//                                 //   border: Border.all(
//                                 //     color: Theme.of(context).primaryColor,
//                                 //   ),
//                                 // ),
//                               );
//                             },
//                           ),
//                         ),
//                         TitleWithIcon(title: 'Location', icon: Icons.edit),
//                         Text(
//                           state.user.location,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1
//                               .copyWith(height: 1.5),
//                         ),
//                         TitleWithIcon(title: 'Interest', icon: Icons.edit),
//                         // Row(
//                         //   children: [
//                         //     CustomTextContainer(text: 'MUSIC'),
//                         //     CustomTextContainer(text: 'ECONOMICS'),
//                         //     CustomTextContainer(text: 'FOOTBALL'),
//                         //   ],
//                         // ),
//                         // TextButton(
//                         //   onPressed: () {
//                         //     RepositoryProvider.of<AuthRepository>(context)
//                         //         .signOut();
//                         //   },
//                         //   child: Center(
//                         //     child: Text(
//                         //       'Sign Out',
//                         //       style: Theme.of(context)
//                         //           .textTheme
//                         //           .headline5
//                         //           .copyWith(
//                         //           color: Theme.of(context).primaryColor),
//                         //     ),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   )
//                 ],
//               );
//             // } else {
//             //   return Text('Something went wrong.');
//             // }
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class TitleWithIcon extends StatelessWidget {
//   final String title;
//   final IconData icon;
//
//   const TitleWithIcon({
//     Key key,
//     this.title,
//     this.icon,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: Theme.of(context).textTheme.headline3,
//         ),
//         IconButton(
//           icon: Icon(icon),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }