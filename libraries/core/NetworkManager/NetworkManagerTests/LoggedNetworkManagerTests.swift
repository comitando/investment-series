import XCTest
import NetworkManagerInterface
@testable import NetworkManager

final class LoggedNetworkManagerTests: XCTestCase {
    
    struct TestModel: Codable, Equatable { let message: String }
    
    func testFetchDataLogs() {
        let (sut, mock, endpoint) = makeSUT()
        
        mock.dataResult = .success(Data())
        
        let task = sut.fetchData(endpoint: endpoint) { _ in }
        
        XCTAssertNotNil(task)
        XCTAssertEqual(mock.methodsCalled, [.fetchDataCalled(endpoint)])
    }
    
    func testFetchAndDecodeDataLogs() {
        let (sut, mock, endpoint) = makeSUT()
        
        mock.decodeResult = .success(TestModel(message: "success"))
        
        let task = sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self) { _ in }
        
        XCTAssertNotNil(task)
        XCTAssertEqual(mock.methodsCalled, [.fetchAndDecodeDataCalled(endpoint)])
    }
    
    func testFetchDataAsyncLogs() async throws {
        let (sut, mock, endpoint) = makeSUT()
        
        let expectedData = try XCTUnwrap("{\"message\":\"success\"}".data(using: .utf8))
        mock.dataResult = .success(expectedData)
        
        do {
            let data = try await sut.fetchData(endpoint: endpoint)
            XCTAssertEqual(data, expectedData)
            XCTAssertEqual(mock.methodsCalled, [.fetchDataCalled(endpoint)])
        } catch {
            XCTFail("Expected success but got error \(error)")
        }
    }
    
    func testFetchAndDecodeDataAsyncLogs() async throws {
        let (sut, mock, endpoint) = makeSUT()
        
        let expectedData = TestModel(message: "success")
        mock.decodeResult = .success(expectedData)
        
        do {
            let data = try await sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self)
            XCTAssertEqual(data, expectedData)
            XCTAssertEqual(mock.methodsCalled, [.fetchAndDecodeDataCalled(endpoint)])
        } catch {
            XCTFail("Expected success but got error \(error)")
        }
    }
    
    func testFetchDataWithErrorLogs() {
        let (sut, mock, endpoint) = makeSUT()
        
        mock.dataResult = .failure(.invalidResponse)
        
        let task = sut.fetchData(endpoint: endpoint) { _ in }
        
        XCTAssertNotNil(task)
        XCTAssertEqual(mock.methodsCalled, [.fetchDataCalled(endpoint)])
    }
    
    func testFetchAndDecodeDataWithErrorLogs() {
        let (sut, mock, endpoint) = makeSUT()
        
        mock.decodeResult = .failure(.invalidResponse)
        
        let task = sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self) { _ in }
        
        XCTAssertNotNil(task)
        XCTAssertEqual(mock.methodsCalled, [.fetchAndDecodeDataCalled(endpoint)])
    }
    
    func testFetchDataAsyncWithErrorLogs() async throws {
        let (sut, mock, endpoint) = makeSUT()
        
        let expectedData = NetworkError.invalidResponse
        mock.dataResult = .failure(expectedData)
        
        do {
            let data = try await sut.fetchData(endpoint: endpoint)
            XCTFail("Expected fail but got \(String(describing: String(data: data, encoding: .utf8)))")
        } catch {
            XCTAssertEqual(error.localizedDescription, expectedData.localizedDescription)
            XCTAssertEqual(mock.methodsCalled, [.fetchDataCalled(endpoint)])
        }
    }
    
    func testFetchAndDecodeDataAsyncWithErrorLogs() async throws {
        let (sut, mock, endpoint) = makeSUT()
        
        let expectedData = NetworkError.invalidResponse
        mock.decodeResult = .failure(expectedData)
        
        do {
            let data = try await sut.fetchAndDecodeData(endpoint: endpoint, responseType: TestModel.self)
            XCTFail("Expected success but got error \(data)")
        } catch {
            XCTAssertEqual(error.localizedDescription, expectedData.localizedDescription)
            XCTAssertEqual(mock.methodsCalled, [.fetchAndDecodeDataCalled(endpoint)])
        }
    }
}

extension LoggedNetworkManagerTests {
    private func makeSUT() -> (sut: LoggedNetworkManager, mock: NetworkManagerSpy, endpoint: Endpoint) {
        let mock = NetworkManagerSpy()
        return (
            LoggedNetworkManager(network: mock),
            mock,
            Endpoint(baseURL: "https://api.example.com", path: "/test", method: .GET)
        )
    }
}
