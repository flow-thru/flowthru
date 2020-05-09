
import React from 'react'
import { Menu, Avatar } from 'antd'
import ContentSearch from './ContentSearch'
import ContentSelect from './ContentSelect'
import logo from '../assets/img/logo.png'
import banner from '../assets/img/banner.png'
import { BellOutlined, MessageOutlined, EditOutlined } from '@ant-design/icons'

const {SubMenu} = Menu

class Nav extends React.Component {
    render() {
        return (
            <Menu mode="horizontal" className='navbar'>
                {/* Logo */}
                <Menu.Item disabled={true} className='navbaritem' style={{cursor: 'auto'}} >
                    <div>
                        <a href="http://localhost:5000">
                            <img src={logo} width="40px" alt="logo" />
                            <img src={banner} width="125px" alt="banner" />
                        </a>
                    </div>
                </Menu.Item>

                {/* Page Select */}
                <Menu.Item disabled={true} className='navbaritem' style={{cursor: 'auto'}}>
                    <ContentSelect />
                </Menu.Item>

                {/* Search Bar */}
                <Menu.Item disabled={true} className='navbaritem' style={{cursor: 'auto'}}>
                    <ContentSearch />
                </Menu.Item>


                {/* Profile */}
                <SubMenu
                    title= {<Avatar size="large" icon={this.props.userIcon} />}
                    style={{float: 'right'}}  className='navbaritem'>
                    <Menu.ItemGroup title={this.props.username}>
                        <Menu.Item key="profile">Profile</Menu.Item>
                        <Menu.Item key="events">User Settings</Menu.Item>
                        <Menu.Item key="logout">Log Out</Menu.Item>
                    </Menu.ItemGroup>
                </SubMenu>

                <Menu.Item icon={<BellOutlined />} className='navbaritem' style={{float: 'right'}}/>
                <Menu.Item icon={<MessageOutlined />} className='navbaritem' style={{float: 'right'}}/>
                <Menu.Item icon={<EditOutlined />} className='navbaritem' style={{float: 'right'}}/>
            </Menu>
        );
    }
}

export default Nav