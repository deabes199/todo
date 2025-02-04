# Todo_app

A simple Flutter Todo app that allows users to manage their tasks effectively. This app includes features like displaying tasks, adding new tasks, and notifications for upcoming tasks.


- 🎨 [Architecture Design](#architecture-design)

  
lib/
│── main.dart      
│── core/
│   ├── database/
│   │   ├── shared pref
│   │   ├── sqflite 
│   ├── di/
│       ├── dependancy injection
│   ├── notification/
│       ├── local notification
│   ├── routing/
│       ├── appRouter
│       ├── routes
│   ├── theme/
│       ├── theme cubit
│   ├── shared componant
│   ├── utils/
│   │   ├── constants
│── features/
│   ├── ui/
│   │   ├── screens
│   │   ├── widgest
│   ├── data/
│   │   ├── models    
│   │   ├── repo
│   ├── logic/
│   │   ├── cubit


## Features

Every feature mainly contains of 3 basic layers `data` , `logic` and `ui`

- **Splash screen** before loading the main app.
- **Onboarding screen** for first-time users.
- **Home screen** displaying a list of task .
- **Add Task** Add task with title and subtitle and date .
- **BottomSheet** delete task or edit to complete.



## Tools

- **flutter_bloc**: For state management using Cubit.
- **sqflte**: Use to Store data .
- **shared_preferences**: For simple local storage
- **date_picker_timeline**:use pick the date
- **flutter local notification**

## Screens
- **HomeScreen**




- **Add task**



- **BottomSheet**




