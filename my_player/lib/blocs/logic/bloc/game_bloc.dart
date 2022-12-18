import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

// class GameBloc extends Bloc<GameEvent, GameState> {
//   GameBloc() : super(GameInitial()) {
//     on<GameEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class GameBloc extends Bloc<GameEvent, int> {
  // 초기값 설정
  GameBloc() : super(0);

  @override
  Stream<int> mapEventToState(GameEvent event) async* {
    // 이벤트에 따라 상태 변화를 시켜준 뒤 리턴해준다
    switch (event) {
      case GameEvent.increment:
        yield state + 1;
        break;
      case GameEvent.decrement:
        yield state - 1;
        break;
      case GameEvent.reset:
        yield 0;
        break;
    }
  }
}

// https://velog.io/@kimbiyam/Flutter-BLoC-%ED%8C%A8%ED%82%A4%EC%A7%80