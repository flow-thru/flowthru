
import React from 'react'
import { Card, Space, Radio, Input } from 'antd';
import { FireOutlined, TeamOutlined, HistoryOutlined } from '@ant-design/icons';

class FilterCard extends React.Component {
   render () {
       return (
            <Card
                size='small'
                style={{ width: 700 }}
            >
                <Radio.Group defaultValue="popular">
                    <Space size='large'>
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
                <Input.Search placeholder='Tags (e.g. "outdoors", "food")' style={{width:'40%', float:'right'}}/>
            </Card>
    )};
}

export default FilterCard