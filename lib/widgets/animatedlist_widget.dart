import 'package:auto_animated/auto_animated.dart';
import 'package:gt_basicbundle/constants/custum_library.dart';

class AnimatedListWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, int index, Animation<double> animation) itembuilder;
  final int itemCount;
  final ScrollController? scrollController;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  const AnimatedListWidget({
    Key? key,
    required this.itembuilder,
    required this.itemCount,
    this.scrollController,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiveList.options(
      itemCount: itemCount,
      // addAutomaticKeepAlives: false,
      // addRepaintBoundaries: false,
      // addSemanticIndexes: false,
      shrinkWrap: shrinkWrap,
      controller: scrollController,
      padding: padding,
      physics: physics ?? const BouncingScrollPhysics(),
      options: LiveOptions(
          showItemInterval: 50.milliseconds,
          showItemDuration: 200.milliseconds,
          delay: 10.milliseconds,
          reAnimateOnVisibility: false),
      itemBuilder: itembuilder,
    );
  }
}

class AnimatedListTile extends StatelessWidget {
  final Widget child;
  final bool cananimate;
  final Animation<double> animation;

  const AnimatedListTile({
    Key? key,
    required this.animation,
    required this.child,
    this.cananimate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!cananimate) {
      return child;
    } else {
      return FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(animation),
            child: child),
      );
    }
  }
}
