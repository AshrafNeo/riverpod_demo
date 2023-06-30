import 'package:dartz/dartz.dart';

abstract class UseCase<Type, P> {
  Future<Either<Exception, Type>> call({required P params});
}
