
import React from 'react'
import Nav from '../components/Nav'
import Content from '../components/Content'
import { Layout } from 'antd'

class Explore extends React.Component {
    render () {
        return (
            <Layout className="layout">
                <Nav
                    currentPage={this.props.currentPage}
                    username={this.props.username}
                    userIcon={this.props.userIcon}
                    theme={this.props.theme}
                />

                <Layout.Content className='layout-content'>
                    <Content />
                </Layout.Content>

                <Layout.Footer style={{ textAlign: 'center' }}>Flowthru ©2020</Layout.Footer>
            </Layout>
        )};
}

export default Explore;
