import Foundation

public protocol RegisterDependenciesProtocol {
    static func register(container: ContainerRegisterProtocol)
    static func registerDummy(container: ContainerRegisterProtocol)
}

public extension RegisterDependenciesProtocol {
    static func registerDummy(container: ContainerRegisterProtocol) {
        register(container: container)
    }
}
