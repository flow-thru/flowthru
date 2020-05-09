
import React from 'react'
import { Space } from 'antd'
import TrendingCard from '../components/TrendingCard'
import CreateCard from '../components/CreateCard'

class HomeFeed extends React.Component {
    render () {
        return (
            <Space size='middle' direction='vertical'>
                <TrendingCard />
                <CreateCard />
            </Space>
        )};
}

export default HomeFeed;
