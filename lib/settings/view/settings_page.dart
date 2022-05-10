import 'package:base_news_app/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return SwitchListTile(
            title: Text('Dark Theme',
                style: Theme.of(context).textTheme.headline1),
            value: state,
            onChanged: (bool value) {
              context.read<ThemeCubit>().onThemeChanged(value);
            },
            subtitle: Text(
              'Light text against dark background',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            secondary: Icon(
              Icons.lightbulb_outline,
              color: Theme.of(context).iconTheme.color,
            ),
          );
        },
      ),
    );
  }
}
