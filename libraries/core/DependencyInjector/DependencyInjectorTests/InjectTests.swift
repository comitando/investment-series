import Foundation
import XCTest
@testable import DependencyInjector

final class InjectTests: XCTestCase {
    
    func testInject_should_not_be_null() {
        let container = makeSUT()
        let result = container.resolve(TestInterface.self)
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result is TestOtherClass)
    }
    
    func testInject_and_validate_strings_properties() {
        let container = makeSUT()
        let result = container.resolve(TestInterface.self) as? TestOtherClass
        
        XCTAssertNotEqual(result?.stringOne, result?.stringTwo)
    }
    
}

// MARK: Helpers
extension InjectTests {
    
    func makeSUT() -> ContainerResolverProtocol {
        let container = GlobalDependency.container
        container.register(String.self) { _ in return "StringOne" }
        container.register(String.self, name: "StringTwo") { _ in return "StringTwo" }
        container.register(TestInterface.self) { _ in return TestOtherClass() }
        return container
    }
    
}

final class TestOtherClass: TestInterface {
    @Inject var stringOne: String
    @Inject(name: "StringTwo") var stringTwo: String
}
