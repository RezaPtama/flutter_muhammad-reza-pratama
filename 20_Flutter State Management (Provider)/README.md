# (20) Flutter State Management (Provider)

### State
- Data yang dapat dibaca saat pembuatan widget
- Dapat berubah saat widget sedang aktif
- Hanya dimiliki oleh StatefulWidget

### Global State
Global State diperlukan agar antara widget dapat memanfaatkan state yang sama dengan mudah. State biasa yang dapat digunakan pada seluruh widget

## Provider
#### Instalisasi provider
- menambahkan package `provider` pada bagian depedencies dalam file `pubspec.yaml`
- jalankan perintah flutter pub get

```sh
depedencies :
    provider : ^6.0.5
    
//kemudian pada terminal
$ flutter pub get
```

#### Membuat State Provider
Definisi state dalam bentuk Class
```sh
import 'package:provider/provider.dart';

class TaskManager with ChangeNotifier {
  final _taskModels = <TaskModel>[];
  List<TaskModel> get taskModels => List.unmodifiable(_taskModels);

  void addTask(TaskModel task){
    _taskModels.add(task);
    notifyListeners();
  }
}
```

#### Mendaftarkan State Provider
- import dalam file `main.dart`
- Daftarkan pada `runApp` dengan `MultiProvider`

```sh
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
```

#### Menggunakan State dari Provider
- Simpan provider dalam variable
- Ambil data dari provider melalui getter


```sh
final ContactProvider = Provider.of<TaskManager>[context];

ContactProvider.taskModels[index][nama] ?? "";
```