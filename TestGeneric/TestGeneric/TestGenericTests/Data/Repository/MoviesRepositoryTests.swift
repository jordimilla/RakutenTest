import XCTest
import Mockit
import RxSwift
import RxBlocking

@testable import TestGeneric

class MoviesRepositoryTests: XCTestCase {

    var mockMoviesService: MockMoviesServices!
    var sut: MoviesRepositoryImpl!
    
    override func setUp() {
        mockMoviesService = MockMoviesServices(testCase: self)
        sut = MoviesRepositoryImpl(moviesService: mockMoviesService, listMoviesTOMapper: listMoviesTOMapper, movieTOMapper: movieTOMapper)
    }

    func test_get_movies() throws {
        let mockList = ListMoviesTO(id: "21", title: "", artwork: "", snapshot: "")
        let mockResponse = ResponseArryTO(data: [mockList])
        
        let _ = mockMoviesService.when()
        .call(withReturnValue: mockMoviesService.getMovies())
        .thenReturn(Single.just(mockResponse))
        
        let result = try sut.getMovies().toBlocking().single()
        
        XCTAssertTrue(result[0].id == mockList.id)
        _ = self.mockMoviesService.verify(verificationMode: Once()).getMovies()
    }
    
    func test_get_getDetailMovie() throws {
        let mockMovie = MovieTO(title: "titlesimo", description: "", image: "")
        let mockResponse = ResponseTO(data: mockMovie)
        
        let _ = mockMoviesService.when()
            .call(withReturnValue: mockMoviesService.getDetailMovie(id: "21"))
        .thenReturn(Single.just(mockResponse))
        
        let result = try sut.getDetailMovie(id: "21").toBlocking().single()
        
        XCTAssertTrue(result.title == mockMovie.title)
        _ = self.mockMoviesService.verify(verificationMode: Once()).getDetailMovie(id: "21")
    }
    
}
