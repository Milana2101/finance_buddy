import 'package:finance_buddy/index.dart';

class BottomBarItem {
  const BottomBarItem({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final _pages = [
    const DashboardView(),
    const StatisticView(),
    const ChatView(),
    const SettingsView(),
  ];

  void _onChanged(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'finance buddy'.toUpperCase(),
          style: context.textTheme.headlineMedium,
        ),

      ),
      bottomNavigationBar: RoundedBottomBar(
        onChanged: _onChanged,
        items: const [
          BottomBarItem(title: '', icon: FontAwesomeIcons.house),
          BottomBarItem(title: '', icon: FontAwesomeIcons.chartSimple),
          BottomBarItem(title: '', icon: FontAwesomeIcons.solidComments),
          BottomBarItem(title: '', icon: FontAwesomeIcons.gear),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}

class RoundedBottomBar extends StatefulWidget {
  const RoundedBottomBar({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialIndex,
  });

  final List<BottomBarItem> items;
  final ValueChanged<int> onChanged;
  final int? initialIndex;

  @override
  State<RoundedBottomBar> createState() => _RoundedBottomBarState();
}

class _RoundedBottomBarState extends State<RoundedBottomBar> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex ?? 0;
  }

  void _onTap(int index) {
    _index = index;
    widget.onChanged(_index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(
          horizontal: 29,
        ),
        // margin: const EdgeInsets.symmetric(
        //   horizontal: 14,
        //   vertical: 8,
        // ),
        // decoration: BoxDecoration(
        //   color: context.scheme.primary,
        //   borderRadius: BorderRadius.circular(16),
        // ),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(widget.items.length, (index) {
            return Expanded(
              child: _RoundedBottomBarItem(
                onTap: () => _onTap(index),
                item: widget.items[index],
                isSelected: _index == index,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _RoundedBottomBarItem extends StatelessWidget {
  const _RoundedBottomBarItem({
    required this.item,
    this.isSelected = false,
    this.onTap,
  });

  final BottomBarItem item;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            // decoration: ShapeDecoration(
            //   shape: const CircleBorder(),
            //   color: isSelected
            //       ? context.scheme.secondary
            //       : context.scheme.onBackground.withOpacity(0.3),
            // ),
            child: Icon(
              item.icon,
              color: isSelected
                  ? context.scheme.primary
                  : context.scheme.onBackground.withOpacity(0.5),
              // color: context.scheme.onPrimary,
              size: 30,
            ),
          ),
          // const Gap(4),
          // Text(
          //   item.title,
          //   style: context.textTheme.labelMedium!.copyWith(
          //       // color: isSelected
          //       //     ? context.scheme.onSecondaryContainer
          //       //     : context.scheme.onPrimary.withOpacity(0.6),
          //       ),
          // ),
        ],
      ),
    );
  }
}
