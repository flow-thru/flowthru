import React from "react";
import ReactDOM from "react-dom";
import { UserOutlined } from '@ant-design/icons'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

import "./index.css";
import * as serviceWorker from "./serviceWorker";
import Nav from './layouts/Nav'
import Home from './pages/Home'
import Footer from './layouts/Footer'



ReactDOM.render((
    <Router>
        <Nav
            currentPage="Home"
            username="username"
            userIcon={< UserOutlined />}
        />

        <Switch>
            <Route path="/" component={Home} />
        </Switch>

        <Footer />
    </Router>
), document.getElementById("root"));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
