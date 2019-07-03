import React from "react";

import logo from "../../logo.png";
import "./home.css";

function Home() {
  return (
    <div className="home">
      <header className="home-header">
        <img src={logo} className="home-logo" alt="logo" />
        <h1>flowthru.io</h1>
        <p>coming soon</p>
      </header>
    </div>
  );
}

export default Home;
