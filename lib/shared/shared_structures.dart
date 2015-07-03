part of app.shared;

/// Registers data structures that will be transferred through the [Tether].
///
///     tether.registerStructure('name', Type, factoryFunction);
///
/// The name is used in the Tether message to tell the other side what to recreate.
/// The type is used to identify what a data structure should be sent as.
/// The factory is used to rebuild the data structure on the other side.
///
/// Note that the data structure must implement [bridge.tether.shared.Serializable], or
/// else it will be cast to a string.
void registerSharedStructures(Tether tether) {
  tether.registerStructure('Template', Template, (serialized) => new Template.deserialize(serialized));
}