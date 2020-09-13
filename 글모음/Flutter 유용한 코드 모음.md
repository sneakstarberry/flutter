## Flutter 유용한 코드 모음



### 1. 스테이터스 바 색 변경

```dart
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.yellow)
  );
```

핸드폰 스테이터스바 색을 변경할 수 있다.



### 2. 서버 자동 변경

``` dart
final String server = defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";
```

호스트 서버를 자동으로 바꿀수 있다.