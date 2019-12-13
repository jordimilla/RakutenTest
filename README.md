Architecture: MVVVM
Technologies: Swinject, Rxswift

Layers:

Presentation Layer contains UI that are coordinated by Presenters/ViewModels which execute 1 or multiple. Presentation Layer depends on Domain Layer.

Domain Layer is the most INNER part of the onion (no dependencies with other layers) and it contains Entities & Repository Interfaces. Use cases combine data from 1 or multiple Repository Interfaces.

Data Layer contains Repository Implementations and 1 or multiple Data Sources. Repositories are responsible to coordinate data from the different Data Sources. Data Layer depends on Domain Layer.
