#### floatingActionButton 2개 이상 만들기

코드:

```dart
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'decrement',
            child: Icon(Icons.remove),
          ),
        ),
      ]),
```

