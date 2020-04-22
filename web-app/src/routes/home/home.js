import React from "react";

import FontAwesomeIcon from 'react-fontawesome'
import logo from "../../img/flow_plain.png";
import "./home.css";

function Home() {
  return (
    <div className="home">
      <header className="home-header">
        <img src={logo} className="home-logo" alt="logo" />
        <h1>flowthru</h1>
        <a href="https://github.com/flow-thru/flowthru" className="home-link"><FontAwesomeIcon name='github' /> contribute</a>
      </header>
    </div>
  );
}

export default Home;
