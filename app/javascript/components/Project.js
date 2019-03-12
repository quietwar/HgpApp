import React from "react"
import PropTypes from "prop-types"
import Timestamp from "react-timestamp"

class Project extends React.Component {
  render () {
    return (
      <React.Fragment>
      <div className="project-title">
        <a href={this.props.path}>{this.props.title}</a>
      </div>
      <div className="project-body">
        {this.props.description}
      <div className="project-meta-details">
        <small>
          Created by: {this.props.author}, {this.props.created_at} ago,
          last updated: {this.props.updated_at} ago
          &nbsp;
          <Timestamp time={this.props.created_at} precision={4} />,
           last updated: <Timestamp time={this.props.updated_at} precision={4} />
          </small>
        </div>
      </div>
      </React.Fragment>
    );
  }
  componentDidMount() {
       var self = this;
       setInterval(function() { self.forceUpdate() }, 5000);
     }

    componentWillUnmount() {
        if (this._timer) {
          clearInterval(this._timer);
          this._timer = null;
        }
      }
    }

Project.propTypes = {
  appName: PropTypes.string,
  projectDetails: PropTypes.node,
  coding: PropTypes.string,
  url: PropTypes.string,
  github: PropTypes.string
};
export default Project
