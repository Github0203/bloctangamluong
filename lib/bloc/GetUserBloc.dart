import 'package:bloc/bloc.dart';
import 'package:btbloc/bloc/GetUserState.dart';
import 'package:btbloc/bloc/UserEvent.dart';
import 'package:btbloc/data/data.dart';

mixin GetUsersBloc implements Bloc<UsersEvent, GetUsersState> {
  @override
  GetUsersState get initialState => GetUsersUnInitial();

  @override
  Stream<GetUsersState> mapEventToState(UsersEvent event) async*{
    // to notify that is loading
    yield GetUsersLoading();
    // if you have multiple event
    if(event is GetUsersEvent){
      yield GetUsersSuccess(listUsers());
    }
    // if have error you can yield GetUsersError state
  }
}
