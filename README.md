# background_location_service

# バックグラウンド位置情報取得のサンプル

# 主なパッケージ
geolocator
flutter_background_service


# 動作概要
起動し、任意のユーザー名を入力
位置情報の取得を開始後、アプリと通知画面に位置情報が表示される

以下の操作を行っても位置情報の取得は引き続き行われる
画面をOFFにする
アプリをバックグラウンドへ
アプリを終了
通知をタップしてアプリを再開
再起動

# 注意事項

OS、バージョンにより動作が異なる可能性がある
位置情報の取得中はバッテリーを消費するため、終了させるタイミングを検討

以下は別途対応必要
位置情報の取得を「常に許可」にするには、二段階で許可を求める必要がある
位置情報の取得をユーザーが拒否した場合、再度許可を求めるダイアログは出せないため、
アプリの設定画面へ遷移する必要がある


/lib/home/screens/home_screen.dart
　ホーム画面　ユーザー名の取得、位置情報の取得開始と停止

/lib/location_service/logic/location_controller/location_controller_cubit.dart
　位置情報を取得するLocationControllerCubitクラスを定義

/lib/location_service/logic/location_controller/location_controller_state.dart
　LocationControllerStateを定義　

/lib/location_service/repository/location_service_repository.dart
　位置情報へのアクセス許可を取得

/lib/tools/background_service.dart
　位置情報を取得し、通知画面へ表示

/lib/notification/notification.dart
　ローカル通知を行うNotificationServiceクラスを定義

/lib/utility 内
　SharedPreferences、SnackBar、LoadingIndicator等

