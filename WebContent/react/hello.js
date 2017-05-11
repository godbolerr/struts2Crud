/*
Creating a component
The most simple component has a `render` method that returns some
JSX. `props` are attributes that are passed into the component 
when you instantiate it. 
One caveat is that `render` must return a single parent element;
you can't return multiple adjacent JSX tags but must wrap them
in one parent element.
*/

var HelloMessage = React.createClass({
  render: function () {
      console.log("Printing Hello Message : " + this.props.message );
	  return <p>Hello {this.props.message}!</p>;
  }
});

ReactDOM.render(<HelloMessage message="World" />, document.getElementById('ReactPaneNew'));