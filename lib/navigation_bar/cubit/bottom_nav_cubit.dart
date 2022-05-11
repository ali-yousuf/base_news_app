import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  final _indexController = BehaviorSubject<int>();

  Sink<int> get navIndexSink => _indexController.sink;

  Stream<int> get navIndexStream => _indexController.stream;

  @override
  Future<void> close() {
    _indexController.close();
    return super.close();
  }

  void onItemTapped(int index) {
    navIndexSink.add(index);
    emit(index);
  }
}
