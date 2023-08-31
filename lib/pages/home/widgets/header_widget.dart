import 'package:flutter/material.dart';
import 'package:flutter_dashboard/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),  // Added top padding
      child: SizedBox(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!Responsive.isDesktop(context))
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () => scaffoldKey.currentState!.openDrawer(),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                ),
              ),
            if (Responsive.isMobile(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar.png",
                        width: 32,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
