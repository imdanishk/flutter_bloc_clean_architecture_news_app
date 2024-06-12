// Abstract class representing a use case with a call method that returns a future of a type.
abstract class UseCase<Type, Params> {
  Future<Type> call({Params params}); // Method to be implemented by subclasses to execute the use case.
}
