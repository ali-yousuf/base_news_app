import 'package:base_news_app/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
        ),
      ),
      body: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return SwitchListTile(
            title: const Text(
              'Dark Theme',
            ),
            value: state,
            onChanged: (bool value) {
              context.read<ThemeCubit>().onThemeChanged(value);
            },
            subtitle: const Text(
              'Light text against dark background',
            ),
            secondary: const Icon(
              Icons.lightbulb_outline,
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
