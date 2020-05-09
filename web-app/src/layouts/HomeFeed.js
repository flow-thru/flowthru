
import EventCard from '../components/EventCard'
import FilterCard from '../components/FilterCard';
import React from 'react'
import { Space } from 'antd'

class HomeFeed extends React.Component {
    render () {
        return (
            <Space size='middle' direction='vertical'>
                <FilterCard />
                <EventCard />
                <EventCard />
                <EventCard />
                <EventCard />
                <EventCard />
            </Space>
        )};
}

export default HomeFeed;
