
import React from 'react'
import { Menu, Row, Col, Space } from 'antd'
import ContentSearch from '../components/ContentSearch'
import ContentSelect from '../components/ContentSelect'
import AvatarMenu from '../components/AvatarMenu'
import logo from '../assets/img/banner_logo.svg'
import { BellOutlined, MessageOutlined, EditOutlined } from '@ant-design/icons'

const {SubMenu} = Menu

class Nav extends React.Component {
    render() {
        return (
            <Row className='navbar' align='middle' justify='space-between'>
                {/* Logo */}
                <Col span={6}>
                    <div>
                        <a href="http://localhost:3000">
                            <img src={logo} width="200px" alt="banner" />
                        </a>
                    </div>
                </Col>

                {/* Page Select */}
                <Col span={6}>
                    <ContentSelect />
                </Col>

                {/* Search Bar */}
                <Col span={6}>
                    <ContentSearch />
                </Col>


                {/* Actions */}
                {/*
                <Col span={6}>
                    <Space size='middle'>
                        <BellOutlined />
                        <MessageOutlined />
                        <EditOutlined />
                    </Space>
                </Col>
                */}

                {/* Profile */}
                <Col span={6}>
                    <AvatarMenu 
                        username={this.props.username}
                    />
                </Col>
        </Row>
        );
    }
}

export default Nav