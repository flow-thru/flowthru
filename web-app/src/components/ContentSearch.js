
import React from 'react'
import { Input, Dropdown, Menu, Card, Space, Avatar, Typography, Button }  from 'antd';
import { RiseOutlined } from '@ant-design/icons'

function TrendCard(props) {
    return (
    <div style={{ 'padding-top': '10px', 'padding-bottom': '10px'}}>
        <Card hoverable size="small" bordered={false} >
            <Typography.Text><RiseOutlined /> Tag </Typography.Text>
            <Card.Meta
                title = {
                <div style={{'padding-top':'5px', 'padding-bottom': '10px'}}>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                </div>
                }
            />
            <Space>
                <Avatar size='small' />
                <Typography.Text>Organization Name</Typography.Text>
            </Space>
        </Card>
    </div>
    )

}

function TrendMenu(props) {
    return (
        <Menu style={{ height:'400px', 'overflow-y':'auto' }}>
            <Menu.ItemGroup title="Trending Today">
                <TrendCard />
                <TrendCard />
                <TrendCard />
            </Menu.ItemGroup>
        </Menu>
    );
}

class ContentSearch extends React.Component {
    render () {
        return (
            <Dropdown overlay={TrendMenu} >
                <Input.Search size="large" placeholder="Search" style={{width:'100%'}}/>
            </Dropdown>
        )
    };
}

export default ContentSearch;