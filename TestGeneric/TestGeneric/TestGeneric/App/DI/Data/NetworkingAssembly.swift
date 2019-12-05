import Foundation
import Swinject
import UIKit
import Moya

class NetworkingAssembly: Assembly{
    
    func assemble(container: Container) {
        
        container.register(MoviesServices.self) { r in
            MoviesServicesImpl(
                provider: r.resolve(MoyaProvider<MoviesAPI>.self)!
            )
            }.inObjectScope(.container)
        
        
    }
}
