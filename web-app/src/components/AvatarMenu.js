
import React from 'react'
import { Dropdown, Menu, Avatar, Button, Divider } from 'antd';


function PageMenu(props) {
    return (
        <Menu >
            <Menu.ItemGroup title={props.username}>
                <Menu.Item key="profile">Profile</Menu.Item>
                <Menu.Item key="events">User Settings</Menu.Item>
                <Menu.Item key="logout">Log Out</Menu.Item>
            </Menu.ItemGroup>
        </Menu>
    );
}

class ContentSelect extends React.Component {
    render () {
        return (
            <Dropdown overlay={PageMenu(this.props)}>
                <Avatar size="large" icon={this.props.userIcon} />
            </Dropdown>
        )
    };
}

export default ContentSelect;