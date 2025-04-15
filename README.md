# data_widgets

## problem

currently a lot of time is spent in flutter syncing widgets with data, usually by way of controllers provided by the framework (TextEditingController, PageController, ScrollController, etc). Also, we often need to manipulate numbers or other primitive types in a TextFormField, but there is a lot of configuration involved.

## goal

to provide a set of simple widgets whose sole purpose is to manipulate or respond to data

## examples

- TextFormField -> IntTextFormField
- TextFormField -> DoubleTextFormField
- TextFormField -> EmailTextFormField
- PageView + PageController + Enum -> EnumPageView
- Stack + Custom Animation + Enum -> EnumStack
- ReorderableListView + Callback + Slideable -> CollectionColumn / CollectionListView

## contributing

- all contributions to codebase or example are welcome
- contact me at [@luke_pighetti](https://x.com/luke_pighetti) on x for questions