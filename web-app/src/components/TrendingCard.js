
import React from 'react'
import { Card, List, Avatar, Typography, Button } from 'antd';
import { CaretUpOutlined } from '@ant-design/icons'

const data = [
  {
    title: 'Organization 1',
  },
  {
    title: 'Organization 2',
  },
  {
    title: 'Organization 3',
  },
  {
    title: 'Organization 4',
  },
];

class TrendingCard extends React.Component {
    render () {
        return (
            <Card
                style={{ width: 350 }}
                cover={<img alt="example" src="https://user-images.githubusercontent.com/194400/49531010-48dad180-f8b1-11e8-8d89-1e61320e1d82.png" />}
            >
                <Typography.Title level={4}>Trending Organizations</Typography.Title>
                <List
                    itemLayout="horizontal"
                    dataSource={data}
                    renderItem={item => (
                    <List.Item>
                        <List.Item.Meta
                        avatar={<Avatar />}
                        title={
                            <>
                            <a href="http://localhost:3000">
                                {item.title}
                            </a>
                            <span style={{float:'right'}}>
                                <CaretUpOutlined style={{color:'#38e01d'}}/>
                            </span>
                            </>}
                        />
                    </List.Item>
                    )}
                />
                <br />
                <Button type='primary' block='true'>View All</Button>
            </Card>
    )};
}

export default TrendingCard;