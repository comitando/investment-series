## NetworkManager e LoggedNetworkManager

### Visão Geral

O `NetworkManager` é uma classe que implementa a interface `NetworkManagerInterface` para realizar operações de rede usando `URLSession`. O `LoggedNetworkManager` é um decorador que adiciona funcionalidades de logging às operações de rede executadas por um `NetworkManagerInterface` subjacente.

### Propriedades

#### NetworkManager

- `session`: Uma instância de `URLSession` usada para realizar as requisições de rede.

#### LoggedNetworkManager

- `network`: Uma instância de `NetworkManagerInterface` que realiza as operações de rede.
- `logger`: Uma instância de `Logger` do framework `os.log` utilizada para registrar informações de rede.

### Inicializadores

#### NetworkManager

```swift
public init(session: URLSession)
```
- `session`: A instância de `URLSession` usada para criar a `NetworkManager`.

#### LoggedNetworkManager

```swift
public init(network: NetworkManagerInterface)
```
- `network`: A instância de `NetworkManagerInterface` que será encapsulada para adicionar funcionalidades de logging.

### Métodos

#### NetworkManager

##### Métodos Baseados em Closure

- `fetchData(endpoint: Endpoint, completion: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionDataTask?`

  Executa uma requisição de rede para obter dados brutos.

- `fetchAndDecodeData<T: Decodable>(endpoint: Endpoint, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask?`

  Executa uma requisição de rede para obter e decodificar dados.

##### Métodos Baseados em Async/Await

- `fetchData(endpoint: Endpoint) async throws -> Data`

  Executa uma requisição de rede para obter dados brutos de maneira assíncrona.

- `fetchAndDecodeData<T: Decodable>(endpoint: Endpoint, responseType: T.Type) async throws -> T`

  Executa uma requisição de rede para obter e decodificar dados de maneira assíncrona.

#### LoggedNetworkManager

Os métodos de `LoggedNetworkManager` implementam `NetworkManagerInterface` e adicionam logging às operações de rede.

### Extensão URLRequest

A extensão `URLRequest` adiciona um método para gerar uma representação cURL da requisição, útil para depuração.

#### `func cURLRepresentation() -> String`

Gera uma representação cURL da requisição.

### Endpoint

A estrutura `Endpoint` define os detalhes de uma requisição de rede, incluindo a URL base, caminho, método HTTP, cabeçalhos, parâmetros e decodificador JSON.

### NetworkError

A enumeração `NetworkError` define os possíveis erros que podem ocorrer durante as operações de rede, como `invalidURL`, `requestFailed`, `invalidResponse`, e `decodingError`.

### Conclusão

A `LoggedNetworkManager` adiciona uma camada de logging detalhado às operações de rede, facilitando a depuração e o monitoramento de requisições e respostas. A `NetworkManager` executa as operações de rede reais utilizando `URLSession`. Juntas, essas classes oferecem uma solução flexível e extensível para gerenciar operações de rede em aplicações Swift.