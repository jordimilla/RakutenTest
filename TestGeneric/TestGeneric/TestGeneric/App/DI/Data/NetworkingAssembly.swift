import Foundation
import Swinject
import UIKit
import Moya

class NetworkingAssembly: Assembly{
    
    func assemble(container: Container) {
        
        container.register(NetworkConfig.self) { _ in
             #if DEBUG
             return NetworkConfig(serverUrlBase: "https://gizmo.rakuten.tv/")
             #else
             return NetworkConfig(serverUrlBase: "https://gizmo.rakuten.tv/")
             #endif
             }.inObjectScope(.container)
        
        container.register(MoviesServices.self) { r in
            MoviesServicesImpl(
                provider: r.resolve(MoyaProvider<MoviesAPI>.self)!
            )
            }.inObjectScope(.container)
        
        container.register(MoyaProvider<MoviesAPI>.self) { r in
            let networkingConfig =  r.resolve(NetworkConfig.self)!
            let provider:MoyaProvider<MoviesAPI> = MoyaFactory.getProvider(baseUrl: networkingConfig.serverUrlBase)
            return provider
        }
    }
}
