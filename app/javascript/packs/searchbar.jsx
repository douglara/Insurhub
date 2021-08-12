import React, { Component } from 'react'
import ReactDOM from 'react-dom'

class Searchbar extends Component {

  constructor(props) {
    super(props);

    this.state = {
      term: '',
      autoCompleteResults: [],
      itemSelected: {},
      showItemSelected: false
    };

    $.getJSON('/app/home/search_category?q=' + this.state.term)
      .then(response => this.setState({ autoCompleteResults: response }))
  }

  getAutoCompleteResults(e){
    this.setState({
      term: e.target.value
    }, () => {
      $.getJSON('/app/home/search_category?q=' + this.state.term)
        .then(response => this.setState({ autoCompleteResults: response }))
    });
  }

  render(){
    let autoCompleteList = this.state.autoCompleteResults.map((response, index) => {
      return <div key={index} className="search-item">
        <a href={`/app/home/index?insurance_category_id=${response.id}`}>{response.name }</a>
      </div>
    });

    return (
      <div>
        <input name="search-bar-input" ref={ (input) => { this.searchBar = input } } value={ this.state.term } onChange={ this.getAutoCompleteResults.bind(this) } type='search' placeholder='What type of insurance you need?' arial-label="What type of insurance you need?" className="form-control" />
        <button className="btn" type="submit"><i className="fas fa-search"></i></button>
        <div className="search-backdrop"></div>
        
        <div className="search-result">
          <div className="search-header">
            Result
          </div>
          { autoCompleteList ? autoCompleteList : <div>teste</div> }
        </div>
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Searchbar />,
    document.getElementById('searchbar'),
  )
});