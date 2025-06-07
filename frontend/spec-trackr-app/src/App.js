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

