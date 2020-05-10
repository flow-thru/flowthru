
import React from 'react'
import { Card, Space, Radio, Input, Row, Col, Select } from 'antd';
import { FireOutlined, TeamOutlined, HistoryOutlined } from '@ant-design/icons';

const children = [];
for (let i = 10; i < 36; i++) {
  children.push(<Select.Option key={i.toString(36) + i}>{i.toString(36) + i}</Select.Option>);
}

class FilterCard extends React.Component {
   render () {
       return (
            <Card size='small' >
                <Row>
                    <Col flex={2}>
                        <Radio.Group defaultValue="popular" style={{width: '100%'}}>
                            <Space size='middle'>
                                <Radio.Button value="popular" style={{'border-radius': '15px'}}>
                                    <span><FireOutlined /> Popular </span>
                                </Radio.Button>
                                <Radio.Button value="active" style={{'border-radius': '15px'}}>
                                    <span><TeamOutlined /> Active</span>
                                </Radio.Button>
                                <Radio.Button value='new' style={{'border-radius': '15px'}}>
                                    <span><HistoryOutlined /> New</span>
                                </Radio.Button>
                            </Space>
                        </Radio.Group>
                    </Col>
                    <Col flex={2}>
                        <Select mode='tags' placeholder='Tags' style={{'min-width': '200px', width:'100%'}}>
                            {children}
                        </Select>
                    </Col>
                </Row>
            </Card>
    )};
}

export default FilterCard