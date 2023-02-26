import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _vegan = widget.currentFilters['vegan'];
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String desc, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(desc),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'vegan': _vegan,
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
                  (v) {
                setState(() {
                  _glutenFree = v;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose-free meals.', _lactoseFree, (v) {
                setState(() {
                  _lactoseFree = v;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include Vegan meals.', _vegan,
                  (v) {
                setState(() {
                  _vegan = v;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include Vegetarian meals.', _vegetarian,
                  (v) {
                setState(() {
                  _vegetarian = v;
                });
              }),
            ],
          ),
        ),
      ]),
    );
  }
}
