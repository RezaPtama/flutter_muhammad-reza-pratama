# (23) Flutter State Management (BLoC)

### Declarative UI
- Flutter memiliki sifat declarative yang artinya flutter membangun UI nya pada screen untuk mencerminkan keadaan state saat ini
 

State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori
Flutter akan membangun ulang UI nya ketika ada state atau data yang berubah
ada 2 jenis state dalam flutter yaitu :
- Ephemeral State
Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widgetnya, contohnya :
PageView,BottomNavigationBar, SwitchBar
- App State
Digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke daat state widget, contohnya :
Login info, pengaturan preferensi pengguna, keranjang belanja.


### Pendekatan State Management
- setState
Lebih cocok penggunaanya apda ephemeral state
- Provider
Penggunaan untuk state management yang lebih kompleks seperti app state, pendekatan ini direkomendasikan oleh tim flutter karena mudah dipelajari
- BLoC (Business Logic Component)
Menggunakan pola stream/observable, untuk memisahkan UI dengan bisnis logicnya.

### BLoC
**Business Logic Component**
Memisahkan antara business logic dengan UI

**Cara Kerja BLoC**
- Menerima event sebagai input
- Dianalisa dan Dikelola di dalam BLoC
- Menghasil state sebagai Output


**Stream**
- rangkaian proses secara asynchronous
- aktor utama di dalam BLoC


**Install Package**
- menambahkan package `BLoC` pada bagian depedencies dalam file `pubspec.yaml`
- jalankan perintah flutter pub get
- 
```dart
depedencies:
    flutter:
        sdk: flutter
    flutter_bloc: ^8.0.1
    equatable: ^2.0.3
```

** Menambahkan Event**
```dart
abstarct class CounterEvent extends Equatable{
    const CounterEvent();
    
    @override
    List<Object> get props => [];
}
class Increment extends CounterEvent();

class Decrement extends CounterEvent();
```

**Menambahkan State**
```dart
class CounterState extends Equatable{
    int value = 0;
    CounterState(this.value);
    
    @override
    List<Object> get props => [value];
}
```

** Menambahkan Logika Bisnis**
```dart
class CounterBloc extends Bloc<CouunterEvent, CounterState> {
    CounterBloc() : super(CounterState(0)){
        on<Increment>((event,emit) => emit(CounterState(state.value + 1)));
        on<Increment>((event,emit) => emit(CounterState(state.value + 1)));
    }
}
```