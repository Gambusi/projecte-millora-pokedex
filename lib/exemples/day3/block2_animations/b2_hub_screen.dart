import 'package:flutter/material.dart';

import '../widgets/block_hub.dart';
import 'animation_controller_tween_screen.dart';
import 'explicit_transition_widgets_screen.dart';
import 'implicit_animation_widgets_screen.dart';
import 'widget_extensions_screen.dart';

class Day3B2HubScreen extends StatelessWidget {
  const Day3B2HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Day3BlockHub(
      appBarTitle: 'Dia 3 · Bloc 2 · Animació i widgets',
      items: [
        Day3DemoItem(
          title: 'AnimationController i Tween',
          subtitle:
              'vsync, dispose, CurvedAnimation, AnimatedBuilder i interpolació begin/end.',
          screen: AnimationControllerTweenScreen(),
        ),
        Day3DemoItem(
          title: 'Extensions i animació implícita',
          subtitle:
              'Encadenar `.animatedOpacity`, `.animatedScale`, `.animatedSlide` sobre el mateix fill.',
          screen: WidgetExtensionsScreen(),
        ),
        Day3DemoItem(
          title: 'Widgets d’animació implícita',
          subtitle:
              'AnimatedContainer, AnimatedOpacity, AnimatedAlign sense controller manual.',
          screen: ImplicitAnimationWidgetsScreen(),
        ),
        Day3DemoItem(
          title: 'Widgets de transition explícita',
          subtitle:
              'FadeTransition, ScaleTransition, RotationTransition i Interval.',
          screen: ExplicitTransitionWidgetsScreen(),
        ),
      ],
    );
  }
}
