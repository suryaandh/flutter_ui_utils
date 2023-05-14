import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final _selectedColor = Colors.white;
  final _unselectedColor = Color(0xff969696);
  final _tabs = [
    Tab(
      text: 'Email',
      // child: const WithEmail(),
    ),
    const Tab(text: 'Phone Number'),
  ];

  int currentSelected = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(5),
            height: kToolbarHeight,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: _selectedColor),
                labelColor: Colors.black,
                unselectedLabelColor: _unselectedColor,
                tabs: _tabs,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                WithEmail(),
                WithoutEmail(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 120,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login Account',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Hello, Welcome back to your account.',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

class WithEmail extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(
        //   height: 90,
        // ),
        // CustomTextField(
        //   title: 'Email',
        //   controller: emailController,
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        // CustomTextField(
        //   title: 'Password',
        //   obsecureText: true,
        //   controller: emailController,
        // )
      ],
    );
  }
}

class WithoutEmail extends StatelessWidget {
  const WithoutEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}

//Custom Text Field
class CustomTextField extends StatelessWidget {
  final String title;
  final bool obsecureText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.title,
    this.obsecureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          child: TextFormField(
            obscureText: obsecureText,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: Color(0xffC2C2C2),
                ),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ),
      ],
    );
  }
}
