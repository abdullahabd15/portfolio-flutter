import 'package:ab_solution_portfolio/data/singleton.dart';
import 'package:ab_solution_portfolio/pages/main/sections/drawer_nav.dart';
import 'package:ab_solution_portfolio/pages/main/sections/footer.dart';
import 'package:ab_solution_portfolio/pages/main/sections/section_contact.dart';
import 'package:ab_solution_portfolio/pages/main/sections/section_experience.dart';
import 'package:ab_solution_portfolio/pages/main/sections/section_intro.dart';
import 'package:ab_solution_portfolio/pages/main/sections/section_projects.dart';
import 'package:ab_solution_portfolio/pages/main/sections/section_skills.dart';
import 'package:ab_solution_portfolio/providers/inview_provider.dart';
import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:provider/provider.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

class MainPage extends StatelessWidget {
  final bool isMobile;

  MainPage({super.key, required this.isMobile});

  final _scrollController = ScrollController();
  final _introKey = GlobalKey();
  final _skillSetKey = GlobalKey();
  final _expKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollToSection(int index) {
    final GlobalKey key;
    switch (index) {
      case 1:
        key = _skillSetKey;
      case 2:
        key = _expKey;
      case 3:
        key = _projectsKey;
      case 4:
        key = _contactKey;
      default:
        key = _introKey;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (index == 0) {
        _scrollController.animateTo(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      } else if (key.currentContext != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InViewProvider>(context);
    final appBar = AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: provider.inViewIndex == 0
          ? Colors.transparent
          : Theme.of(context).primaryColor,
      iconTheme: const IconThemeData(color: SingletonData.colorAmber),
      actions: isMobile
          ? []
          : _navigationMenus(context, (index) => _scrollToSection(index)),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: appBar,
      drawer: isMobile
          ? DrawerNav(
              navigationMenus: _navigationMenus(
                context,
                (index) {
                  Navigator.pop(context);
                  _scrollToSection(index);
                },
                isMobile: isMobile,
              ),
            )
          : null,
      body: ScrollEdgeListener(
        edge: ScrollEdge.start,
        listener: () {
          Provider.of<InViewProvider>(context, listen: false)
              .setInViewVisible(0);
        },
        child: InViewNotifierCustomScrollView(
          throttleDuration: const Duration(milliseconds: 10),
          isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) {
            return deltaTop < (0.5 * vpHeight) &&
                deltaBottom > (0.5 * vpHeight);
          },
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: InViewNotifierWidget(
                key: _introKey,
                id: '1',
                builder: (context, isInView, child) {
                  final provider = Provider.of<InViewProvider>(context);
                  if (isInView) provider.setInViewVisible(0);
                  return SectionIntro(isMobile: isMobile);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  InViewNotifierWidget(
                    key: _skillSetKey,
                    id: '2',
                    builder: (context, isInView, child) {
                      final provider = Provider.of<InViewProvider>(context);
                      if (isInView) provider.setInViewVisible(1);
                      return const Padding(
                        padding: EdgeInsets.only(top: 124),
                        child: SectionSkills(),
                      );
                    },
                  ),
                  InViewNotifierWidget(
                    key: _expKey,
                    id: '3',
                    builder: (context, isInView, child) {
                      final provider = Provider.of<InViewProvider>(context);
                      if (isInView) provider.setInViewVisible(2);
                      return const Padding(
                        padding: EdgeInsets.only(top: 124),
                        child: SectionExperience(),
                      );
                    },
                  ),
                  InViewNotifierWidget(
                    key: _projectsKey,
                    id: '4',
                    builder: (context, isInView, child) {
                      final provider = Provider.of<InViewProvider>(context);
                      if (isInView) provider.setInViewVisible(3);
                      return const Padding(
                        padding: EdgeInsets.only(top: 124),
                        child: SectionProjects(),
                      );
                    },
                  ),
                  InViewNotifierWidget(
                    key: _contactKey,
                    id: '5',
                    builder: (context, isInView, child) {
                      final provider =
                          Provider.of<InViewProvider>(context, listen: false);
                      if (isInView) provider.setInViewVisible(4);
                      return Padding(
                        padding: const EdgeInsets.only(top: 124),
                        child: Container(
                          color: const Color(0xF7F9FBFF),
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: const SectionContact(),
                        ),
                      );
                    },
                  ),
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _navigationMenus(BuildContext context, Function(int) onMenuClick,
    {bool isMobile = false}) {
  const menus = ['Intro', 'Skills', 'Experience', 'Projects', 'Contact'];
  final provider = Provider.of<InViewProvider>(context);
  const textColor = SingletonData.colorAmber;
  return List.generate(
    menus.length,
    (index) {
      String menu = menus[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: provider.inViewIndex == index
            ? OutlinedButton(
                onPressed: () => onMenuClick(index),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: textColor,
                    width: 2,
                  ),
                ),
                child: Text(menu, style: const TextStyle(color: textColor)),
              )
            : TextButton(
                onPressed: () => onMenuClick(index),
                child: Text(
                  menu,
                  style: const TextStyle(color: textColor),
                ),
              ),
      );
    },
  );
}
