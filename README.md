# data_widgets

## problem

currently a lot of time is spent in flutter syncing widgets with data, usually by way of controllers provided by the framework (TextEditingController, PageController, ScrollController, etc). Also, we often need to manipulate numbers or other primitive types in a TextFormField, but there is a lot of configuration involved.

## goal

to provide a set of simple widgets whose sole purpose is to manipulate or respond to data

## vision

### ListView

Imagine using `ListView` to display a list of values. The two common ways are read only and don't integrate with the `List` type.

```dart
final values = [1,2,3,4];

ListView(
    children: [
        for(final x in values)
            ListTile(title: Text("$x"))
    ]
)
```

consider a version of `ListView` that instead accepts a source `List`, but also has an `onChange` callback and allowed the user to drag-to-reorder or delete items, while also animating items being added/moved/deleted when the source `List` was mutated.


```dart
final values = [1,2,3,4];

CollectionListView(
    source: values,
    builder: (context, x){
        return ListTile(title: Text("$x"))
    },
    onChange: (updatedValues){
        setState(()=>values = updatedValues);
    },
    actions: [CollectionAction.move, CollectionAction.delete],
)
```

## areas to disrupt

- TextFormField -> IntTextFormField
- TextFormField -> DoubleTextFormField
- TextFormField -> EmailTextFormField
- PageView + PageController + Enum -> EnumPageView
- Stack + Custom Animation + Enum -> EnumStack
- ReorderableListView + Callback + Slideable -> CollectionColumn / CollectionListView

## contributing

- all contributions to codebase or example are welcome
- look at SwiftUI for inspiration. they are the current leader in data driven components
- contact me at [@luke_pighetti](https://x.com/luke_pighetti) on x for questions