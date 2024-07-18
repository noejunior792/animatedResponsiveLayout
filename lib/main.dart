import 'package:flutter/material.dart';

import 'animations.dart';                               // Add this import
import 'models/data.dart' as data;
import 'models/models.dart';
import 'widgets/animated_floating_action_button.dart';  // Add this import
import 'widgets/disappearing_bottom_navigation_bar.dart';
import 'widgets/disappearing_navigation_rail.dart';
import 'widgets/email_list_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: Feed(currentUser: data.user_0),
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({
    super.key,
    required this.currentUser,
  });

  final User currentUser;

  @override
  State<Feed> createState() => _FeedState();
}

// Add SingleTickerProviderStateMixin to _FeedState
class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);
                                                    // Add from here...
  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1250),
      value: 0,
      vsync: this);
  late final _railAnimation = RailAnimation(parent: _controller);
  late final _railFabAnimation = RailFabAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);
                                                    // ... to here.

  int selectedIndex = 0;
  // Remove wideScreen
  bool controllerInitialized = false;                   // Add this variable

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    // Remove wideScreen reference
                                                  // Add from here ...
    final AnimationStatus status = _controller.status;
    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
                                                   // ... to here.
  }

                                                  // Add from here ...
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
                                                  // ... to here.

  @override
  Widget build(BuildContext context) {
                                                 // Modify from here ...
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Scaffold(
          body: Row(
            children: [
              DisappearingNavigationRail(
                railAnimation: _railAnimation,
                railFabAnimation: _railFabAnimation,
                selectedIndex: selectedIndex,
                backgroundColor: _backgroundColor,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              Expanded(
                child: Container(
                  color: _backgroundColor,
                  child: EmailListView(
                    selectedIndex: selectedIndex,
                    onSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    currentUser: widget.currentUser,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: AnimatedFloatingActionButton(
            animation: _barAnimation,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: DisappearingBottomNavigationBar(
            barAnimation: _barAnimation,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        );
      },
    );
                                                     // ... to here.
  }
}