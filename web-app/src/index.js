import React from "react";
import ReactDOM from "react-dom";

import "./index.css";

import Home from './pages/Home'

import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import * as serviceWorker from "./serviceWorker";

ReactDOM.render((
    <Router>
        <Switch>
            <Route path="/" component={Home} />
        </Switch>
    </Router>
), document.getElementById("root"));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
