import React from "react";
import ReactDOM from "react-dom";

import Nav from './components/Nav'
import Home from './pages/Home'
import "./index.css";
import * as serviceWorker from "./serviceWorker";

import { UserOutlined } from '@ant-design/icons'
import { Layout } from 'antd'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

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

        <Layout.Footer style={{ textAlign: 'center' }}>Flowthru ©2020</Layout.Footer>
    </Router>
), document.getElementById("root"));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
