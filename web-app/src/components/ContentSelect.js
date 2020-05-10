
import React from 'react'
import { Dropdown, Menu, Button} from 'antd';
import { OrderedListOutlined, RiseOutlined, HomeOutlined, CaretDownOutlined } from '@ant-design/icons'


function PageMenu(props) {
    return (
        <Menu style={{ height:'350px', 'overflow-y':'auto' }}>
            <Menu.ItemGroup title="Feeds">
                <Menu.Item key="home" icon={< HomeOutlined />}>Home</Menu.Item>
                <Menu.Item key="popular" icon={<RiseOutlined />}>Popular</Menu.Item>
                <Menu.Item key="communities" icon={<OrderedListOutlined />}>Top Communities</Menu.Item>
            </Menu.ItemGroup>
            <Menu.ItemGroup title="My Communities">
                <Menu.Item key="setting:3">Community 3</Menu.Item>
                <Menu.Item key="setting:4">Community 4</Menu.Item>
                <Menu.Item key="setting:5">Community 5</Menu.Item>
                <Menu.Item key="setting:6">Community 6</Menu.Item>
                <Menu.Item key="setting:7">Community 7</Menu.Item>
                <Menu.Item key="setting:8">Community 8</Menu.Item>
                <Menu.Item key="setting:9">Community 9</Menu.Item>
                <Menu.Item key="setting:10">Community 10</Menu.Item>
                <Menu.Item key="setting:11">Community 11</Menu.Item>
                <Menu.Item key="setting:12">Community 12</Menu.Item>
                <Menu.Item key="setting:13">Community 13</Menu.Item>
                <Menu.Item key="setting:14">Community 14</Menu.Item>
                <Menu.Item key="setting:15">Community 15</Menu.Item>
            </Menu.ItemGroup>
        </Menu>
    );
}

class ContentSelect extends React.Component {
    render () {
        return (
            <Dropdown overlay={PageMenu} >
                <Button size='large' block={true}>
                        <span style={{float:'left'}}><HomeOutlined /> Home</span>  <span style={{float:'right'}}><CaretDownOutlined /></span>
                </Button>
            </Dropdown>
        )
    };
}

export default ContentSelect;