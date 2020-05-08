
import React from 'react'
import { Menu, Input, Avatar, Switch } from 'antd'
import logo from '../assets/img/logo.png'
import banner from '../assets/img/banner.png'
import { CaretDownOutlined } from '@ant-design/icons'
const {SubMenu} = Menu

class Nav extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            theme: this.props.theme
        }
    }

    toggleTheme() {
        let theme = this.state.theme;
        theme = theme === 'dark' ? 'light' : 'dark';
        this.setState({
            theme: theme
        })
    }

    render() {
        return (
            <Menu mode="horizontal" theme={this.state.theme} className='navbar'>
                {/* Logo */}
                <Menu.Item className='navbaritem'>
                    <a href="http://localhost:3000">
                        <img src={logo} width="40px" alt="logo" />
                        <img src={banner} width="125px" alt="banner" />
                    </a>
                </Menu.Item>

                {/* Page Select */}
                <SubMenu icon={<CaretDownOutlined />} title={this.props.currentPage} className='navbaritem'>
                    <Menu.ItemGroup title="Feeds">
                        <Menu.Item key="Home">Home</Menu.Item>
                        <Menu.Item key="Popular">Popular</Menu.Item>
                        <Menu.Item key="Top Organizations">Top Organizations</Menu.Item>
                    </Menu.ItemGroup>
                    <Menu.ItemGroup title="My Organizations">
                        <Menu.Item key="setting:3">Option 3</Menu.Item>
                        <Menu.Item key="setting:4">Option 4</Menu.Item>
                    </Menu.ItemGroup>
                </SubMenu>

                {/* Search Bar */}
                <Menu.Item disabled={true} className='navbaritem' style={{cursor: 'auto'}}>
                    <Input.Search placeholder="Search" size="large" />
                </Menu.Item>

                {/* Profile */}
                <SubMenu icon={<CaretDownOutlined />}
                    title= {<Avatar size="large" icon={this.props.userIcon} />}
                    style={{float: 'right'}}  className='navbaritem'>
                    <Menu.ItemGroup title={this.props.username}>
                        <Menu.Item key="profile">My Profile</Menu.Item>
                        <Menu.Item key="events">Events</Menu.Item>
                        <Menu.Item key="organizations">Organizations</Menu.Item>
                    </Menu.ItemGroup>
                    <Menu.ItemGroup title="Settings">
                        <Menu.Item key="darkmode" disabled={true} style={{cursor: 'auto'}}>
                            <Switch
                                checked={this.state.theme === 'dark'}
                                onChange={() => this.toggleTheme()}
                            />
                            Dark mode
                        </Menu.Item>
                        <Menu.Item key="settings">More Settings</Menu.Item>
                    </Menu.ItemGroup>
                </SubMenu>
            </Menu>
        );
    }
}

export default Nav