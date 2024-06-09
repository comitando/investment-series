import Foundation

public protocol NetworkClientInterface {
    typealias NetworkClientResult = Result<(Data, HTTPURLResponse), Error>
    func request(from url: URL, completion: @escaping (NetworkClientResult) -> Void)
}
