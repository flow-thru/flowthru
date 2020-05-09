
import React from 'react'
import Content from '../components/Content'
import { Layout } from 'antd'

class UserContent extends React.Component {
    render () {
        return (
            <Layout className="layout">
                <Layout.Content className='layout-content'>
                    <Content />
                </Layout.Content>
            </Layout>
        )};
}

export default UserContent;
