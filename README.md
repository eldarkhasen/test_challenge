# test_challenge

A new Flutter project.

## Getting Started

This project is made for a Test Challenge Used technologies:

- DI: GetIT
- State Management: BLoC
- Local DataBase: Isar, SharedPrefs
- CustomPaint: Clippath

App Architecture Description:

The architecture of the Flutter app follows a structured and modular design, separating the
application into several layers to enhance maintainability and scalability:

UI Layer:

- The UI layer represents the user interface of the app, comprising widgets, screens, and user
  interactions.
- It sends user events and receives data updates from the BLOC layer.
- The UI layer is responsible for presenting data to the user and handling user input.

BLOC Layer (Business Logic):

- The BLOC layer acts as an intermediary between the UI layer and other data-related layers.
- It processes user events and manages the application's state and business logic.
- BLOCs communicate with the Repository layer to fetch and store data.

Repository Layer:

- The Repository layer serves as a bridge between the BLOC layer and the data source (local
  database).
- It provides a unified API for data access, abstracting away the specifics of data retrieval and
  storage.
- The Repository may include error handling logic and transform low-level errors into
  application-specific failures.
- Special Exception, Failure models were conceived with the understanding of scaling the application
  so that HTTP requests could be implemented

DataSource Layer (Local Database):

- In this architecture, the client is a local database.
- The DataSource layer interacts with the local database to perform data retrieval and storage
  operations.
  
Also, project has ability to change two styles:

- Dark
- Light


