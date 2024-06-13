import Foundation
import XCTest
@testable import DependencyInjector

final class RegisterDependenciesTests: XCTestCase {
    
    let container = GlobalDependency.container
    
    override func setUp() {
        super.setUp()
        RegisterTest.registerDummy(container: container)
    }
    
    override func tearDown() {
        super.tearDown()
        container.removeAll()
    }
    
    func testTest1Interface() {
        XCTAssertNotNil(container.resolve(Test1Interface.self))
        XCTAssertNotNil(container.resolve(Test2Interface.self))
        XCTAssertNotNil(container.resolve(Test3Interface.self))
        XCTAssertNotNil(container.resolve(Test4Interface.self))
        XCTAssertNotNil(container.resolve(Test5Interface.self))
        XCTAssertNotNil(container.resolve(Test6Interface.self))
        XCTAssertNotNil(container.resolve(Test7Interface.self))
        XCTAssertNotNil(container.resolve(Test8Interface.self))
        XCTAssertNotNil(container.resolve(Test9Interface.self))
        XCTAssertNotNil(container.resolve(Test10Interface.self))
        XCTAssertNotNil(container.resolve(Test11Interface.self))
        XCTAssertNotNil(container.resolve(Test12Interface.self))
        XCTAssertNotNil(container.resolve(Test13Interface.self))
        XCTAssertNotNil(container.resolve(Test14Interface.self))
        XCTAssertNotNil(container.resolve(Test15Interface.self))
        XCTAssertNotNil(container.resolve(Test16Interface.self))
        XCTAssertNotNil(container.resolve(Test17Interface.self))
        XCTAssertNotNil(container.resolve(Test18Interface.self))
        XCTAssertNotNil(container.resolve(Test19Interface.self))
        XCTAssertNotNil(container.resolve(Test20Interface.self))
        XCTAssertNotNil(container.resolve(Test21Interface.self))
    }
    
}

final class RegisterTest: RegisterDependenciesProtocol {

    static func register(container: ContainerRegisterProtocol) {
        container.autoregister(Test1Interface.self, initializer: Test1.init)
        container.autoregister(Test2Interface.self, initializer: Test2.init)
        container.autoregister(Test3Interface.self, initializer: Test3.init)
        container.autoregister(Test4Interface.self, initializer: Test4.init)
        container.autoregister(Test5Interface.self, initializer: Test5.init)
        container.autoregister(Test6Interface.self, initializer: Test6.init)
        container.autoregister(Test7Interface.self, initializer: Test7.init)
        container.autoregister(Test8Interface.self, initializer: Test8.init)
        container.autoregister(Test9Interface.self, initializer: Test9.init)
        container.autoregister(Test10Interface.self, initializer: Test10.init)
        container.autoregister(Test11Interface.self, initializer: Test11.init)
        container.autoregister(Test12Interface.self, initializer: Test12.init)
        container.autoregister(Test13Interface.self, initializer: Test13.init)
        container.autoregister(Test14Interface.self, initializer: Test14.init)
        container.autoregister(Test15Interface.self, initializer: Test15.init)
        container.autoregister(Test16Interface.self, initializer: Test16.init)
        container.autoregister(Test17Interface.self, initializer: Test17.init)
        container.autoregister(Test18Interface.self, initializer: Test18.init)
        container.autoregister(Test19Interface.self, initializer: Test19.init)
        container.autoregister(Test20Interface.self, initializer: Test20.init)
        container.autoregister(Test21Interface.self, initializer: Test21.init)
    }

}

protocol Test1Interface {}
final class Test1: Test1Interface {}

protocol Test2Interface {}
final class Test2: Test2Interface {
    private let test1: Test1Interface
    init(test1: Test1Interface) {
        self.test1 = test1
    }
}

protocol Test3Interface {}
final class Test3: Test3Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
    }
}

protocol Test4Interface {}
final class Test4: Test4Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
    }
}

protocol Test5Interface {}
final class Test5: Test5Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
    }
}

protocol Test6Interface {}
final class Test6: Test6Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
    }
}

protocol Test7Interface {}
final class Test7: Test7Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
    }
}

protocol Test8Interface {}
final class Test8: Test8Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
    }
}

protocol Test9Interface {}
final class Test9: Test9Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
    }
}

protocol Test10Interface {}
final class Test10: Test10Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
    }
}

protocol Test11Interface {}
final class Test11: Test11Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
    }
    
}

protocol Test12Interface {}
final class Test12: Test12Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
    }
}

protocol Test13Interface {}
final class Test13: Test13Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
    }
}

protocol Test14Interface {}
final class Test14: Test14Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
    }
}

protocol Test15Interface {}
final class Test15: Test15Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    private let test14: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface, test14: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
        self.test14 = test14
    }
}

protocol Test16Interface {}
final class Test16: Test16Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    private let test14: Test1Interface
    private let test15: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface, test14: Test1Interface, test15: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
        self.test14 = test14
        self.test15 = test15
    }
}

protocol Test17Interface {}
final class Test17: Test17Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    private let test14: Test1Interface
    private let test15: Test1Interface
    private let test16: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface, test14: Test1Interface, test15: Test1Interface, test16: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
        self.test14 = test14
        self.test15 = test15
        self.test16 = test16
    }
}

protocol Test18Interface {}
final class Test18: Test18Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    private let test14: Test1Interface
    private let test15: Test1Interface
    private let test16: Test1Interface
    private let test17: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface, test14: Test1Interface, test15: Test1Interface, test16: Test1Interface, test17: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
        self.test14 = test14
        self.test15 = test15
        self.test16 = test16
        self.test17 = test17
    }
}

protocol Test19Interface {}
final class Test19: Test19Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    private let test14: Test1Interface
    private let test15: Test1Interface
    private let test16: Test1Interface
    private let test17: Test1Interface
    private let test18: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface, test14: Test1Interface, test15: Test1Interface, test16: Test1Interface, test17: Test1Interface, test18: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
        self.test14 = test14
        self.test15 = test15
        self.test16 = test16
        self.test17 = test17
        self.test18 = test18
    }
}

protocol Test20Interface {}
final class Test20: Test20Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    private let test14: Test1Interface
    private let test15: Test1Interface
    private let test16: Test1Interface
    private let test17: Test1Interface
    private let test18: Test1Interface
    private let test19: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface, test14: Test1Interface, test15: Test1Interface, test16: Test1Interface, test17: Test1Interface, test18: Test1Interface, test19: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
        self.test14 = test14
        self.test15 = test15
        self.test16 = test16
        self.test17 = test17
        self.test18 = test18
        self.test19 = test19
    }
}

protocol Test21Interface {}
final class Test21: Test21Interface {
    private let test1: Test1Interface
    private let test2: Test1Interface
    private let test3: Test1Interface
    private let test4: Test1Interface
    private let test5: Test1Interface
    private let test6: Test1Interface
    private let test7: Test1Interface
    private let test8: Test1Interface
    private let test9: Test1Interface
    private let test10: Test1Interface
    private let test11: Test1Interface
    private let test12: Test1Interface
    private let test13: Test1Interface
    private let test14: Test1Interface
    private let test15: Test1Interface
    private let test16: Test1Interface
    private let test17: Test1Interface
    private let test18: Test1Interface
    private let test19: Test1Interface
    private let test20: Test1Interface
    init(test1: Test1Interface, test2: Test1Interface, test3: Test1Interface, test4: Test1Interface, test5: Test1Interface, test6: Test1Interface, test7: Test1Interface, test8: Test1Interface, test9: Test1Interface, test10: Test1Interface, test11: Test1Interface, test12: Test1Interface, test13: Test1Interface, test14: Test1Interface, test15: Test1Interface, test16: Test1Interface, test17: Test1Interface, test18: Test1Interface, test19: Test1Interface, test20: Test1Interface) {
        self.test1 = test1
        self.test2 = test2
        self.test3 = test3
        self.test4 = test4
        self.test5 = test5
        self.test6 = test6
        self.test7 = test7
        self.test8 = test8
        self.test9 = test9
        self.test10 = test10
        self.test11 = test11
        self.test12 = test12
        self.test13 = test13
        self.test14 = test14
        self.test15 = test15
        self.test16 = test16
        self.test17 = test17
        self.test18 = test18
        self.test19 = test19
        self.test20 = test20
    }
}
