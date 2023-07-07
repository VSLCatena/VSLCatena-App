# Clean Architecture

- [Domain Layer](#domain-layer)
    - [Models](#domain-models)
    - [Repositories](#domain-repositories)
    - [Use Cases](#use-cases)
- [Data Layer](#data-layer)
    - [Repositories](#data-repositories)
    - [Data Sources](#data-sources)
    - [Models](#data-models)
    - [Mappers](#mappers)
- [Presentation Layer](#presentation-layer)
    - [App](#app)
    - [Pages](#pages)
    - [Blocs](#blocs)
    - [Widgets](#widgets)
    - [Presentation Mappers](#presentation-mappers)

      
In our application, we adhere to Clean Architecture principles to achieve clear separation between different layers. This layering technique promotes maintainability, testability, and ease of code modification. Changes in one layer do not directly affect others, allowing for independent updates and iterations. For instance, altering the data layer does not necessitate changes in the presentation layer, and vice versa.

The architecture consists of the following layers:

- Domain
- Data
- Presentation


## Domain Layer
The domain layer is essentially the heart of our application, dictating the business logic that should exist. It describes what is accessible to the other layers and outlines their implementation.

This layer is divided into three sections:

### Domain Models
Models are classes that encapsulate the data utilized in the app, functioning as a vehicle to transport data across different layers.

### Domain Repositories
Repositories are interfaces that outline how data is retrieved and stored. They provide a contract that use cases utilize to handle data. Their actual implementation often resides in the data layer.

### Use Cases
Use cases define the business logic that the application can access. By leveraging repositories, they retrieve and store data. While primarily used by the presentation layer, the data layer can also utilize them.


## Data Layer
The data layer is responsible for data retrieval and storage, embodying all code that interacts with the backend.

The data layer is subdivided into:

### Data Repositories
Repositories are concrete implementations of their counterparts defined in the domain layer, responsible for data retrieval and storage, and they utilize data sources to perform these actions.

### Data Sources
Data sources specify how data is retrieved and stored, returning raw models that should subsequently be transformed into domain models via mappers. These can include remote services (like API endpoints) or local storage.

### Data Models
Models here represent raw objects received from the backend. These objects aren't directly used by the rest of the app but are processed by mappers to transform them into models as defined in the domain layer.

### Mappers
Mappers map raw models to domain models. They define how this transformation happens and assist repositories in converting data retrieved from data sources into the format dictated by the domain layer.


## Presentation Layer
The presentation layer, closest to the user, houses all the UI code. It makes use of MVVM architecture, with blocs serving as the view models.

This layer consists of:

### App
The app serves as the root of the presentation layer, holding code responsible for navigation routing and theming. The routes lead to various pages, representing different screens within the app.

### Pages
Pages correspond to the various screens within the app. They encapsulate the code responsible for screen layout and navigation between different pages.

### Blocs
Blocs segregate UI code from business logic, forming the backbone of the presentation layer's business logic. Used by pages to retrieve and store data, blocs interact with the use cases in the domain layer to access this data.

### Widgets
Widgets are reusable components that can be used by pages to build their UI. They are often used to display data retrieved from blocs. Widgets can define their own models, which are then mapped to bloc states via presentation mappers.

### Presentation Mappers
The presentation layer's mappers map domain models to presentation models, which are then used by widgets to display data. They define how this transformation happens and assist blocs in converting data retrieved from use cases into the format dictated by the presentation layer.