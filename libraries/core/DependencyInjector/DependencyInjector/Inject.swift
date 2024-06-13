import Foundation

@propertyWrapper
public struct Inject<Dependency> {

    private var dependency: Dependency
    private var name: String?

    public init(_ container: ContainerResolverProtocol = GlobalDependency.container, name: String? = nil) {
        self.dependency = container.resolveDependency(Dependency.self, name: name)
        self.name = name
    }

    public var wrappedValue: Dependency {
        get { return dependency }
        set { dependency = newValue }
    }
}
