
import React from 'react'
import HomeFeed from '../layouts/HomeFeed'
import HomeSidebar from '../layouts/HomeSidebar'
import { Row, Col } from 'antd'

class Home extends React.Component {
    render () {
        return (
            <div className='content'>
                <Row className='content' justify='center' gutter={[16, 16]}>
                    <Col flex={2} style={{maxWidth: 700}}>
                        <HomeFeed />
                    </Col>
                    <Col flex={2} style={{maxWidth: 400}}>
                        <HomeSidebar />
                    </Col>
                </Row>
            </div>
        )};
}

export default Home;