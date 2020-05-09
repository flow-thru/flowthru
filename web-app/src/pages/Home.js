
import React from 'react'
import HomeFeed from '../layouts/HomeFeed'
import HomeSidebar from '../layouts/HomeSidebar'
import { Layout, Row, Col, Space } from 'antd'

class Home extends React.Component {
    render () {
        return (
            <Layout>
                <div className='layout-content'>
                    <Row justify='center' style={{'padding-top': '16px'}}>
                        <Space align='start' size='middle'>
                        <Col span={16}>
                            <HomeFeed />
                        </Col>
                        <Col span={8}>
                            <HomeSidebar />
                        </Col>
                        </Space>
                    </Row>
                </div>
            </Layout>
        )};
}

export default Home;