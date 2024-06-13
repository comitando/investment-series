import Foundation
import Swinject
import SwinjectAutoregistration

public protocol ContainerRegisterProtocol {
    @discardableResult func register<Service>(_ serviceType: Service.Type, name: String?, factory: @escaping (Resolver) -> Service) -> ServiceEntry<Service>
    @discardableResult func register<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service>(_ service: Service.Type, name: String?, initializer: @escaping (()) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service>(_ service: Service.Type, initializer: @escaping (()) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A>(_ service: Service.Type, name: String?, initializer: @escaping (A) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A>(_ service: Service.Type, initializer: @escaping (A) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B>(_ service: Service.Type, initializer: @escaping ((A, B)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C>(_ service: Service.Type, initializer: @escaping ((A, B, C)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C)) -> Service) -> ServiceEntry<Service>

    @discardableResult func autoregister<Service, A, B, C, D>(_ service: Service.Type, initializer: @escaping ((A, B, C, D)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D)) -> Service) -> ServiceEntry<Service>

    @discardableResult func autoregister<Service, A, B, C, D, E>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S)) -> Service) -> ServiceEntry<Service>
    
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T)) -> Service) -> ServiceEntry<Service>
    @discardableResult func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_ service: Service.Type, name: String?, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T)) -> Service) -> ServiceEntry<Service>
}

extension Container: ContainerRegisterProtocol {
    @discardableResult
    public func register<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service) -> ServiceEntry<Service> {
        return register(serviceType, name: nil, factory: factory)
    }
    
    @discardableResult
    public func autoregister<Service>(_ service: Service.Type, initializer: @escaping (()) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A>(_ service: Service.Type, initializer: @escaping (A) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B>(_ service: Service.Type, initializer: @escaping ((A, B)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C>(_ service: Service.Type, initializer: @escaping ((A, B, C)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }

    @discardableResult
    public func autoregister<Service, A, B, C, D>(_ service: Service.Type, initializer: @escaping ((A, B, C, D)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }

    @discardableResult
    public func autoregister<Service, A, B, C, D, E>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
    @discardableResult
    public func autoregister<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T)) -> Service) -> ServiceEntry<Service> {
        return autoregister(service, name: nil, initializer: initializer)
    }
    
}
