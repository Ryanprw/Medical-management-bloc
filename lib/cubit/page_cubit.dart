import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  //method untuk melakukan set
  void setPage(int newPage) {
    emit(newPage);
  }
}
