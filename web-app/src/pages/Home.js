
import React from 'react'
import Explore from '../layouts/Explore'
import { UserOutlined } from '@ant-design/icons'

class Home extends React.Component {
    render () {
        return (
            <Explore
                currentPage='Home'
                username="oscarolazabal"
                userIcon={< UserOutlined />}
                theme="light"
            />
        )};
}

export default Home;