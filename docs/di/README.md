# DependencyInjector

## Visão Geral

Este documento fornece uma descrição técnica detalhada dos componentes e funcionalidades do código Swift responsável pelo registro e resolução de dependências usando os frameworks `Swinject` e `SwinjectAutoregistration`. Este código inclui protocolos, extensões e estruturas para facilitar a injeção de dependências em um aplicativo Swift.

## Estrutura do Código

### Protocolos

#### `ContainerRegisterProtocol`

O protocolo `ContainerRegisterProtocol` define uma série de métodos para registrar e autoregistrar serviços no contêiner de injeção de dependências. Esses métodos permitem a criação de entradas de serviço (`ServiceEntry`) para diferentes tipos de serviços com diversos números de parâmetros no inicializador.

```swift
public protocol ContainerRegisterProtocol {
    @discardableResult func register<Service>(_ serviceType: Service.Type, name: String?, factory: @escaping (Resolver) -> Service) -> ServiceEntry<Service>
    @discardableResult func register<Service>(_ serviceType: Service.Type, factory: @escaping (Resolver) -> Service) -> ServiceEntry<Service>
    
    // Métodos de autoregister para até 20 parâmetros no inicializador
}
```

#### `ContainerResolverProtocol`

O protocolo `ContainerResolverProtocol` define métodos para resolver serviços registrados no contêiner. Ele inclui métodos para resolver dependências opcionais e obrigatórias.

```swift
public protocol ContainerResolverProtocol: AnyObject {
    func resolve<Service>(_ serviceType: Service.Type) -> Service?
    func resolve<Service>(_: Service.Type, name: String?) -> Service?
    func resolveDependency<Service>(_ serviceType: Service.Type) -> Service
    func resolveDependency<Service>(_ serviceType: Service.Type, name: String?) -> Service
}
```

#### `RegisterDependenciesProtocol`

O protocolo `RegisterDependenciesProtocol` define métodos para registrar dependências no contêiner. Ele inclui um método padrão para registrar "dummies" para testes.

```swift
public protocol RegisterDependenciesProtocol {
    static func register(container: ContainerRegisterProtocol)
    static func registerDummy(container: ContainerRegisterProtocol)
}

public extension RegisterDependenciesProtocol {
    static func registerDummy(container: ContainerRegisterProtocol) {
        register(container: container)
    }
}
```

### Extensões

#### Extensão de `Container` para `ContainerRegisterProtocol`

Esta extensão implementa os métodos do `ContainerRegisterProtocol` para a classe `Container` do Swinject.

```swift
extension Container: ContainerRegisterProtocol {
    // Implementações dos métodos register e autoregister
}
```

#### Extensão de `Container` para `ContainerResolverProtocol`

Esta extensão implementa os métodos do `ContainerResolverProtocol` para a classe `Container` do Swinject.

```swift
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
```

### Classes e Estruturas

#### `GlobalDependency`

A classe `GlobalDependency` fornece um contêiner global para dependências, permitindo acesso centralizado ao contêiner Swinject.

```swift
public final class GlobalDependency {
    public static let container = Container()
}
```

#### `Inject`

A estrutura `Inject` é uma property wrapper que resolve e injeta dependências automaticamente a partir do contêiner global ou de um contêiner fornecido.

```swift
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
```

## Descrição dos Métodos

### Métodos de Registro

Os métodos `register` e `autoregister` permitem registrar serviços no contêiner de injeção de dependências. A diferença principal entre eles é que `autoregister` utiliza inicializadores que suportam até 20 parâmetros, facilitando a configuração automática de dependências complexas.

- `register<Service>(_:name:factory:)`: Registra um serviço com um nome opcional e uma fábrica.
- `autoregister<Service>(_:initializer:)`: Registra um serviço com um inicializador que suporta diversos números de parâmetros.

### Métodos de Resolução

Os métodos de resolução permitem obter instâncias de serviços registrados no contêiner.

- `resolve<Service>(_:name:)`: Resolve um serviço opcionalmente nomeado.
- `resolveDependency<Service>(_:name:)`: Resolve um serviço obrigatoriamente, falhando se não estiver registrado.

## Uso

### Registro de Dependências

Para registrar dependências, você pode implementar o protocolo `RegisterDependenciesProtocol` e definir as dependências no método `register`.

```swift
struct MyDependencyRegistry: RegisterDependenciesProtocol {
    static func register(container: ContainerRegisterProtocol) {
        container.autoregister(MyService.self, initializer: MyService.init)
        container.autoregister(AnotherService.self) { AnotherService(dependency: $0.resolve(MyService.self)!) }
    }
}
```

### Injeção de Dependências

Para injetar dependências em suas classes, utilize o property wrapper `Inject`.

```swift
class MyViewController: UIViewController {
    @Inject private var myService: MyService

    override func viewDidLoad() {
        super.viewDidLoad()
        myService.doSomething()
    }
}
```

## Conclusão

Este código fornece uma infraestrutura robusta para a injeção de dependências em aplicativos Swift, utilizando os frameworks Swinject e SwinjectAutoregistration. Através de protocolos, extensões e property wrappers, ele facilita o registro e a resolução de dependências de maneira automática e eficiente, suportando desde casos simples até configurações complexas com múltiplos parâmetros.