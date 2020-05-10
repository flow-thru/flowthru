
import React from 'react'
import { Input, Dropdown, Menu, Card, Space, Avatar, Typography }  from 'antd';
import { RiseOutlined } from '@ant-design/icons'

function TrendCard(props) {
    var s1  = {
        'padding-top':5,
        'padding-bottom':5,
        width: props.width - 50,
        margin: 'auto'
    }
    var s2  = {
        'padding-top':5,
        'padding-bottom':5,
    }
    return (
            <div style={s1}>
            <Card hoverable size="small" bordered={false}>
                <Typography.Text><RiseOutlined /> Tag </Typography.Text>
                    <div style={s2}>
                        Lorem ipsum dolor sit amet Lorem ipsum doum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolum dolor sit amet Lorem ipsum door sit amet Lorem ipsum dolor sit amet 
                    </div>
                <Space>
                    <Avatar size='small' />
                    <Typography.Text>Community Name</Typography.Text>
                </Space>
            </Card>
            </div>
    )

}

function TrendMenu(props) {
    return (
        <Menu style={{ height:'400px', 'overflow-y':'auto' }}>
            <Menu.ItemGroup title="Trending Today">
                <TrendCard width={props.width}/>
                <TrendCard width={props.width}/>
                <TrendCard width={props.width}/>
            </Menu.ItemGroup>
        </Menu>
    );
}


function ContentSearch(props) {
    return (
        <Dropdown overlay={TrendMenu(props)} >
                <Input.Search  size="large" placeholder="Search" style={{width:'100%'}}/>
        </Dropdown>
    )
}

export default ContentSearch;