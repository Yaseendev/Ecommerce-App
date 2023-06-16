import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  CouponBloc() : super(CouponInitial()) {
    on<CouponEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
