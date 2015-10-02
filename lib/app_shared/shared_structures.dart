part of app.shared;

/// Registers data structures that will be transferred through the [Tether].
void registerTransport() {
  registerViewTransport(); // bridge.view
  registerExceptionsTransport(); // bridge.exceptions
  registerTetherTransport(); // bridge.tether

  // This is a serializer registration, where we implement two functions,
  // one where we break down the class (serialize), and one where we recreate
  // it from the serialized object (deserialize). We also need to provide the
  // type of the class, as well as a string to represent it.
  //
  // From this point on, the [Tether] knows how to send through this data
  // structure, and will seamlessly sort out the transport automatically.
  serializer.register('User', User,
      serialize: /* List */ (User user) => [
        user.firstName, user.lastName,
        user.password, user.email,
        user.id, user.createdAt, user.updatedAt,
      ],
      deserialize: /* User */ (List serialized) => new User()
        ..firstName = serialized[0]
        ..lastName = serialized[1]
        ..password = serialized[2]
        ..email = serialized[3]
        ..id = serialized[4]
        ..createdAt = serialized[5]
        ..updatedAt = serialized[6]);
}