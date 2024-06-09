import Foundation
import XCTest
import Swinject
@testable import DependencyInjector

final class DependencyInjectorTests: XCTestCase {
    
    func testResolve_should_not_be_null() {
        let container = makeSUT()
        let result = container.resolve(TestInterface.self)
        
        XCTAssertNotNil(result)
    }
    
    func testResolveDependence_isTestOne() {
        let container = makeSUT()
        let result = container.resolveDependency(TestInterface.self)
        
        XCTAssertTrue(result is TestClass)
    }
    
    func testResolve_different_instances() {
        let container = makeSUT()
        let testOne = container.resolveDependency(TestInterface.self) as? TestClass
        let otherTestOne = container.resolveDependency(TestInterface.self) as? TestClass
        let result = testOne === otherTestOne
        
        XCTAssertFalse(result)
    }
    
    func testResolve_same_instances() {
        let container = makeSUT(.container)
        let testOne = container.resolveDependency(TestInterface.self) as? TestClass
        let otherTestOne = container.resolveDependency(TestInterface.self) as? TestClass
        let result = testOne === otherTestOne
        
        XCTAssertTrue(result)
    }
}

// MARK: Helpers
extension DependencyInjectorTests {
    
    func makeSUT(_ scope: ObjectScope = ObjectScope.transient) -> ContainerResolverProtocol {
        let container = GlobalDependency.container
        container.register(TestInterface.self) { _ in return TestClass() }.inObjectScope(scope)
        return container
    }
    
}

protocol TestInterface {}
final class TestClass: TestInterface {}
