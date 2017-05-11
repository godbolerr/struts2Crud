'use strict';

// tag::vars[]
//const React = require('react');
//const ReactDOM = require('react-dom')
//const client = require('./client');
// end::vars[]

// tag::app[]
class App extends React.Component {

	constructor(props) {
		super(props);
		this.state = {employees: []};
	}

	componentDidMount() {

		var _this = this;
		axios.get('http://localhost:10002/employees')
		  .then(function (response) {
		    console.log(response.data.employees);
		    _this.setState({employees: response.data.employees});
		  })
		  .catch(function (error) {
		    console.log(error);
		  });
		
//		client({method: 'GET', path: '/api/employees'}).done(response => {
//			this.setState({employees: response.entity._embedded.employees});
//		});
	}

	render() {
		return (
			<EmployeeList employees={this.state.employees}/>
		)
	}
}
// end::app[]

// tag::employee-list[]
class EmployeeList extends React.Component{
	render() {
		var employees = this.props.employees.map(employee =>
			<Employee key={employee.firstName} employee={employee}/>
		);
		return (
			<table>
				<tbody>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Description</th>
					</tr>
					{employees}
				</tbody>
			</table>
		)
	}
}
// end::employee-list[]

// tag::employee[]
class Employee extends React.Component{
	render() {
		return (
			<tr>
				<td>{this.props.employee.firstName}</td>
				<td>{this.props.employee.lastName}</td>
				<td>{this.props.employee.description}</td>
			</tr>
		)
	}
}
// end::employee[]

// tag::render[]
ReactDOM.render(
	<App />,
	document.getElementById('ReactPaneNew')
)
// end::render[]

