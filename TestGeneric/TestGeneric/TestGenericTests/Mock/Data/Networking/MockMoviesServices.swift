import Foundation
import Mockit
import XCTest
import RxSwift

@testable import TestGeneric

class MockMoviesServices: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockMoviesServices {
        return self
    }
}

extension MockMoviesServices: MoviesServices {
    
    func getMovies() -> Single<ResponseArryTO<ListMoviesTO>> {
        let mockResponse = ResponseArryTO<ListMoviesTO>(data: [])
        return callHandler.accept(Single.just(mockResponse), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<ResponseArryTO<ListMoviesTO>>
    }
    
    func getDetailMovie(id: String) -> Single<ResponseTO<MovieTO>> {
        let mockMovie = MovieTO(title: "", description: "", image: "")
        let mockResponse = ResponseTO<MovieTO>(data: mockMovie)
        return callHandler.accept(Single.just(mockResponse), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<ResponseTO<MovieTO>>
    }
}
