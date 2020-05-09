
import React from 'react'
import { Dropdown, Menu, Button} from 'antd';
import { OrderedListOutlined, RiseOutlined, HomeOutlined, CaretDownOutlined } from '@ant-design/icons'


const menu = (
        <Menu style={{ height:'350px', 'overflow-y':'auto' }}>
            <Menu.ItemGroup title="Feeds">
                <Menu.Item key="Home" icon={< HomeOutlined />}>Home</Menu.Item>
                <Menu.Item key="Popular" icon={<RiseOutlined />}>Popular</Menu.Item>
                <Menu.Item key="Top Organizations" icon={<OrderedListOutlined />}>Top Organizations</Menu.Item>
            </Menu.ItemGroup>
            <Menu.ItemGroup title="My Organizations">
                <Menu.Item key="setting:3">Organization 3</Menu.Item>
                <Menu.Item key="setting:4">Organization 4</Menu.Item>
                <Menu.Item key="setting:5">Organization 5</Menu.Item>
                <Menu.Item key="setting:6">Organization 6</Menu.Item>
                <Menu.Item key="setting:7">Organization 7</Menu.Item>
                <Menu.Item key="setting:8">Organization 8</Menu.Item>
                <Menu.Item key="setting:9">Organization 9</Menu.Item>
                <Menu.Item key="setting:10">Organization 10</Menu.Item>
                <Menu.Item key="setting:11">Organization 11</Menu.Item>
                <Menu.Item key="setting:12">Organization 12</Menu.Item>
                <Menu.Item key="setting:13">Organization 13</Menu.Item>
                <Menu.Item key="setting:14">Organization 14</Menu.Item>
                <Menu.Item key="setting:15">Organization 15</Menu.Item>
            </Menu.ItemGroup>
        </Menu>
);

class ContentSelect extends React.Component {
    render () {
        return (
            <Dropdown overlay={menu} >
                <Button size='large' style={{ width:250 }}>
                        <span style={{float:'left'}}><HomeOutlined />Home</span>  <span style={{float:'right'}}><CaretDownOutlined /></span>
                </Button>
            </Dropdown>
        )
    };
}

export default ContentSelect;