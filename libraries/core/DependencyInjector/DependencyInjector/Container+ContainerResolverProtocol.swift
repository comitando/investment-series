import Foundation
import Swinject

public protocol ContainerResolverProtocol: AnyObject {
    func resolve<Service>(_ serviceType: Service.Type) -> Service?
    func resolve<Service>(_: Service.Type, name: String?) -> Service?
    func resolveDependency<Service>(_ serviceType: Service.Type) -> Service
    func resolveDependency<Service>(_ serviceType: Service.Type, name: String?) -> Service
}

extension Container: ContainerResolverProtocol {
    public func resolveDependency<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(serviceType) else {
            preconditionFailure("Failed to resolve dependency: \(serviceType)")
        }
        return dependency
    }

    public func resolveDependency<Service>(_ serviceType: Service.Type, name: String?) -> Service {
        guard let dependency = resolve(serviceType, name: name) else {
            preconditionFailure("Failed to resolve dependency: \(serviceType) with name: \(String(describing: name))")
        }
        return dependency
    }
}

