
import React from 'react'
import { Row, Col } from 'antd'

class Footer extends React.Component {
    render () {
        return (
            <Row justify='space-around' align='middle' style={{height: '75px'}}>
                <Col span={24}>
                    <div className='footer'>Flowthru ©2020</div>
                </Col>
            </Row>
        )};
}

export default Footer;
