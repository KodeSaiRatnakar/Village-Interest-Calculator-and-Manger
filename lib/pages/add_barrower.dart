part of 'pages.dart';

class AddBarrower extends ConsumerWidget {
  const AddBarrower({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Add Barrower',
          style: context.textTheme.headlineLarge,
        ),
      ),
      body: Container(
        height: context.deviceHeight,
        width: context.deviceWidth,
        decoration: backgroundGradient,
      ),
    );
  }
}
