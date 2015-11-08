part of app.shared;

/// Registers data structures on the serializer.
void registerTransport() {
  registerViewTransport(); // bridge.view
  registerExceptionsTransport(); // bridge.exceptions
  registerTetherTransport(); // bridge.tether
  registerValidationTransport(); // bridge.validation

  // This is a serializer registration, where we teach Bridge how to break
  // down and rebuild a class.
  //
  // From this point on, the [Tether] knows how to send through this data
  // structure, and will seamlessly sort out the transport automatically.
  serializer.register('app.shared.User', User,

      // The [serialize] function takes an instance of the class and turns
      // it into an object that can be cast to JSON. Like a map. It can also
      // be a list or any of the primitive types, like [bool], [String] and
      // so forth.
      //
      // If returning a Map or a List, this method doesn't have to care whether
      // or not the items in the collection is castable to JSON. As long as
      // those types have their own registered serialization protocol, it'll
      // sort it out recursively.
      serialize: (User user) => {
        'first_name': user.firstName,
        'last_name': user.lastName,
        'password': user.password,
        'email': user.email,
        'id': user.id,
        'created_at': user.createdAt,
        'updated_at': user.updatedAt,
      },

      // In the [deserialize] function, we receive the serialized structure
      // from the [serialize] function, and turn it back to the class in
      // question. In this case, a [User] class.
      deserialize: (Map serialized) => new User()
        ..firstName = serialized['first_name']
        ..lastName = serialized['last_name']
        ..password = serialized['password']
        ..email = serialized['email']
        ..id = serialized['id']
        ..createdAt = serialized['created_at']
        ..updatedAt = serialized['updated_at']
  );
}