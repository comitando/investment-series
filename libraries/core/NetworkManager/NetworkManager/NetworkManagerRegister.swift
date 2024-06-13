import Foundation
import DependencyInjector
import NetworkManagerInterface

final class NetworkClientRegister: RegisterDependenciesProtocol {
    static func register(container: ContainerRegisterProtocol) {
        container.register(NetworkManagerInterface.self) { resolver in
            let networkManager = resolver.resolve(NetworkManagerInterface.self, name: "NetworkManager")!
            return LoggedNetworkManager(network: networkManager)
        }
        
        container.register(NetworkManagerInterface.self, name: "NetworkManager") { _ in
            let session = URLSession(configuration: .ephemeral)
            return NetworkManager(session: session)
        }
    }
}
