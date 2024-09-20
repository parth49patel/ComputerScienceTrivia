# ComputerScienceTrivia
Trivia App built using SwiftUI with custom animations for transitions and button interactions

## Features Implemented
1. <b>Codable -></b> Utilized JSON for encoding/decoding questions, and implemnted <i>Codable</i> for parsing JSON.
2. <b>LazyVGrid -></b> For displaying the multiple choice options
3. <b>@Published -></b> For state management, when the user changes the difficluty level, the questions are filtered accordingly.
4. <b>Sheet with <i>.presentationDetents()</i> -></b> Used custom sheet modifier for displaying the different views.
5. <b>Enum</b> -> Integrated filter option to let the user choose the level of difficuluty for the questions. Different options are defined in an <i>ENUM</i> and is set to "All" by default. <i>.onTapGesture</i> is used to select the level of difficulty.
6. <b>Animations</b> -> Used <i>.animation</i> and <i>.transition</i> to add animation to the home screen of the game.

