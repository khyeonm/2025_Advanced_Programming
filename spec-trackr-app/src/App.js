// import logo from './logo.svg';
// import './App.css';

// function App() {
//   return (
//     <div className="App">
//       <header className="App-header">
//         <img src={logo} className="App-logo" alt="logo" />
//         <p>
//           Edit <code>src/App.js</code> and save to reload.
//         </p>
//         <a
//           className="App-link"
//           href="https://reactjs.org"
//           target="_blank"
//           rel="noopener noreferrer"
//         >
//           Learn React
//         </a>
//       </header>
//     </div>
//   );
// }

// export default App;

import React, { useState } from "react";
import ComSp from "./com_sp";      // Desktop-1
import SpCom from "./sp_com";    // Desktop-2

function App() {
  const [screen, setScreen] = useState("DESKTOP1");

  return (
    <div>
      {screen === "DESKTOP1" && (
        <ComSp onSpecTabClick={() => setScreen("DESKTOP2")} />
      )}
      {screen === "DESKTOP2" && (
        <SpCom onCompanyTabClick={() => setScreen("DESKTOP1")} />
      )}
    </div>
  );
}

export default App;

