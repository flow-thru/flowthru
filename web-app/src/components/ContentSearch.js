
import React from 'react'
import { Input, Dropdown, Menu, Card}  from 'antd';


const menu = (
        <Menu style={{ height:'400px', 'overflow-y':'auto' }}>
            <Menu.ItemGroup title="Trending Today">
                <Card size="small" bordered={false} title="Organization 1" extra={<a href="http://localhost:3000">More</a>} style={{ width: 285 }}>
                    <p>Maecenas tempus scelerisque ex, vel gravida ante malesuada quis. Morbi ornare est et felis consectetur </p>
                </Card>
                <Card size="small" bordered={false} title="Event 1" extra={<a href="http://localhost:3000">More</a>} style={{ width: 285 }}>
                    <p>Maecenas tempus scelerisque ex, vel gravida ante malesuada quis. Morbi ornare est et felis consectetur </p>
                </Card>
                <Card size="small" bordered={false} title="Article 1" extra={<a href="http://localhost:3000">More</a>} style={{ width: 285 }}>
                    <p>Maecenas tempus scelerisque ex, vel gravida ante malesuada quis. Morbi ornare est et felis consectetur </p>
                </Card>
            </Menu.ItemGroup>
        </Menu>
);

class ContentSearch extends React.Component {
    render () {
        return (
            <Dropdown overlay={menu} >
                <Input.Search size="large" placeholder="Search" style={{ width: 300 }}/>
            </Dropdown>
        )
    };
}

export default ContentSearch;