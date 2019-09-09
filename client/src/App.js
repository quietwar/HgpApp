import React, { Component } from 'react';

import { UserList } from './users';

// const App = () => (
//     <Admin dataProvider={dataProvider}>
// -       <Resource name="users" list={ListGuesser} />
// +       <Resource name="users" list={UserList} />
//     </Admin>
// );

class App extends Component {
  componentDidMount() {
    window.fetch('/api/classrooms')
    .then(response => response.json())
    .then(json => console.log(json))
    .catch(error => console.log(error));
  }
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src="HGP_Yellow_small 2.png" className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
           <a>
          //   className="App-link"
          //   href="https://reactjs.org"
          //   target="_blank"
          //   rel="noopener noreferrer"
          // >
            Lets Go!!
          </a>
        </header>
      </div>
    );
  }
}

export default App;
