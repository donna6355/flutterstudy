//https://tv.naver.com/v/29723803/list/752716
// Main => App => View => Bloc => UseCase => Repository => DataSource

import 'dart:collection';

class OrderResult {}

class Order {}

class LocalDatasource {
  Future<void> sendOrder(Order order) async {}
}

class RemoteDatasource {
  Future<void> sendOrder(Order order) async {}
}

//bad case
// class OrderRepository {
//   final LocalDatasource _localDatasource = LocalDatasource(); // 결합도 의존도가 너무 높음
//   final RemoteDatasource _remoteDatasource =
//       RemoteDatasource(); // 결합도 의존도가 너무 높음

//   Future<OrderResult> sendOrder(Order order) async {
//     final LocalRes = await _localDatasource.sendOrder(order);
//     final remoteRes = await _remoteDatasource.sendOrder(order);
//     return OrderResult();
//   }
// }

// improve
// create abstract class
//
abstract class OrderRepository {
  Future<OrderResult> sendOrder(Order order);
}

class OrderRepositoryImpl implements OrderRepository {
  final LocalDatasource _localDatasource = LocalDatasource();
  final RemoteDatasource _remoteDatasource = RemoteDatasource();

  @override
  Future<OrderResult> sendOrder(Order order) async {
    final LocalRes = await _localDatasource.sendOrder(order);
    final remoteRes = await _remoteDatasource.sendOrder(order);
    return OrderResult();
  }
}

//bad case
// class SendOrderUsecase {
//   final OrderRepository _orderRepository = OrderRepository(); // 결합도 의존도가 너무 높음

//   Future<OrderResult> sendOrder(Order order) =>
//       _orderRepository.sendOrder(order);
// }

//1. inject dependency thru constructor
class SendOrderUsecase {
  final OrderRepository _orderRepository;

  SendOrderUsecase(this._orderRepository);

  Future<OrderResult> sendOrder(Order order) =>
      _orderRepository.sendOrder(order);
}

//2. inject dependency by setter
class SendOrderUsecaseTwo {
  // late OrderRepository _orderRepository;
  OrderRepository? _orderRepository;

  set orderRepository(OrderRepository orderRepository) =>
      _orderRepository = orderRepository;

  Future<OrderResult> sendOrder(Order order) =>
      _orderRepository?.sendOrder(order) ?? Future.value(OrderResult());
}

//static service locator
class ServiceLocator {
  static ServiceLocator?
      _instance; // possible to inject mock instance for testing

  final OrderRepository _orderRepository;
  ServiceLocator(this._orderRepository);

  static void load(ServiceLocator serviceLocator) => _instance = serviceLocator;
  static OrderRepository getOrderRepository() => _instance!._orderRepository;
}

class SendOrderUsecaseThree {
  final OrderRepository _orderRepository = ServiceLocator.getOrderRepository();

  Future<OrderResult> sendOrder(Order order) =>
      _orderRepository.sendOrder(order);
}

class DynamicServiceLocator {
  static DynamicServiceLocator? _instance;
  final HashMap<String, dynamic> _services = HashMap();

  static void load(DynamicServiceLocator serviceLocator) =>
      _instance = serviceLocator;
  void loadSevice(String key, dynamic object) => _services[key] = object;
  static OrderRepository getService(String key) => _instance!._services[key];
}

class SendOrderUsecaseFour {
  final OrderRepository _orderRepository =
      DynamicServiceLocator.getService('OrderRepository');

  Future<OrderResult> sendOrder(Order order) =>
      _orderRepository.sendOrder(order);
}

//서비스 로케이터 단점
//종속성을 숨김... 일반 di에서는 constructor에서 주입해주니까 종속성을 알 수 잇는데... 서비스 로케이터를 사용하면 이것을 오히려 숨기게 된다...
//전역 싱글톤 패턴
//런타임 에러