
import React from 'react'
import { Button, Card, Typography } from 'antd'

class CreateCard extends React.Component {
    render() {
        return (
            <Card
                style={{ width: 350 }}
                cover={<img alt="example" src="https://www.adventuresnt.com.au/wp-content/uploads/2015/03/banner-placeholder.jpg" />}
            >
                <Typography.Title level={4}>Home</Typography.Title>
                <p>Home is a place to explore and engage in the organizations you are part of. Expand the platform by creating your own events and organizations!</p>
                <Button type='primary' block={true}>Create Event</Button>
                <div style={{'padding-top': '12px'}}>
                    <Button block={true}>Create Organization</Button>
                </div>
            </Card>
        )
    };
}

export default CreateCard;