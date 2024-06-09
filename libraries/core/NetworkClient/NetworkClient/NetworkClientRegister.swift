import Foundation
import NetworkClientInterface
import DependencyInjector

final class NetworkClientRegister: RegisterDependenciesProtocol {
    static func register(container: ContainerRegisterProtocol) {
        container.register(NetworkClientInterface.self) { _ in
            let session = URLSession(configuration: .ephemeral)
            return NetworkClient(session: session)
        }
    }
    
    static func registerDummy(container: ContainerRegisterProtocol) {
        container.autoregister(NetworkClientInterface.self, initializer: NetworkClientDummy.init)
    }
}
