import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/profile/widgets/widgets.dart';

@RoutePage()
class ProfileMasterScreen extends StatefulWidget {
  const ProfileMasterScreen({super.key});

  @override
  State<ProfileMasterScreen> createState() => _ProfileMasterScreenState();
}

class _ProfileMasterScreenState extends State<ProfileMasterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController experienceController = TextEditingController();
  final TextEditingController coverLetterController = TextEditingController();

  final List<int> listIds = [];

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void selectCategory(id) {
    setState(() {
      if (listIds.any((el) => el == id)) {
        listIds.remove(id);
      } else {
        listIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardTheme.color,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Я Мастер',
          style: theme.textTheme.titleMedium,
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                labelColor: theme.iconTheme.color,
                unselectedLabelColor: theme.colorScheme.tertiary,
                tabAlignment: TabAlignment.start,
                indicator: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.transparent)),
                dividerHeight: 0,
                tabs: [
                  Tab(
                    child: Text(
                      'Виды работ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Сопроводительное письмо',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  )
                ])),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: TabBarView(controller: _tabController, children: [
          CategorySelectionTab(
              listIds: listIds, selectCategory: selectCategory),
          CoverLetterTab(
              experienceController: experienceController,
              coverLetterController: coverLetterController)
        ]),
      ),
    );
  }
}
