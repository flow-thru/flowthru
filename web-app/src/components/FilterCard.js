
import React from 'react'
import { Card, Space, Button, Input } from 'antd';
import { FireOutlined, TeamOutlined, HistoryOutlined } from '@ant-design/icons';

class FilterCard extends React.Component {
   render () {
       return (
            <Card
                size='small'
                style={{ width: 700 }}
            >
                <Space size='large'>
                    <Button shape='round'>
                        <span><FireOutlined /> Popular </span>
                    </Button>
                    <Button shape='round'>
                        <span><TeamOutlined /> Active</span>
                    </Button>
                    <Button shape='round'>
                        <span><HistoryOutlined /> New</span>
                    </Button>
                    <Input.Search placeholder='Tag (e.g. "outdoors", "food")'/>
                </Space>

            </Card>
    )};
}

export default FilterCard