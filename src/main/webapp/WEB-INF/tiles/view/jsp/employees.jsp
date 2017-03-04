<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.nav li').removeClass('active');
		$('#employeeTab').addClass('active');
	});
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="body_content">
	<div class="container" id="employeeController"
		ng-controller="EmployeeController">
		<div class="row"
			style="border: grey solid 1px; padding: 10px 0 20px 20px; margin-top: 80px;">
			<span style="font-size: 1.2em; font-weight: bold;">Add New
				Employee</span>
			<div class="col-sm-12">
				<div class="col-sm-3">
					<input id="empfName" class="form-control" type="text"
						ng-model="newEmployee.firstName" placeholder="First Name">
				</div>
				<div class="col-sm-3">
					<input id="emplName" class="form-control" type="text"
						ng-model="newEmployee.lastName" placeholder="Last Name">
				</div>
				<div class="col-sm-3">
					<input id="empEmail" class="form-control" type="text"
						ng-model="newEmployee.email" placeholder="Email">
				</div>
				<div class="col-sm-3">
					<button type="button" class="btn btn-primary"
						ng-click="addEmployee()">Add</button>
				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 20px; text-align: center;">
			<span style="font-size: 1.2em; font-weight: bold;"> Employees</span>
			<div ng-if="dataWrapper.data.length>0" class="totalRecords">Total
				Records: {{dataWrapper.totalElement}} , Total Pages:
				{{dataWrapper.totalPages}}</div>
			<div ng-if="!dataWrapper.data.length>0" class="recordNotFound">
				<i class="glyphicon glyphicon-user fa-lg" aria-hidden="true"></i>
				&nbsp;Employee Not Available
			</div>
		</div>
		<div class="row" style="max-height: 330px; overflow: auto;">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Sr</th>
						<th>Emp Id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="employee in dataWrapper.data">
						<td>#
							{{(dataWrapper.pageNumber-1)*dataWrapper.pageSize+$index+1}}</td>
						<td>{{employee.id}} <span e-class="hidden"
							editable-text="employee.id" e-name="id" e-form="rowform"
							e-required></td>
						<td><span editable-text="employee.firstName"
							e-name="firstName" e-form="rowform" e-required> {{
								employee.firstName || 'empty' }} </span></td>
						<td><span editable-text="employee.lastName" e-name="lastName"
							e-form="rowform" e-required> {{ employee.lastName ||
								'empty' }} </span></td>
						<td><span editable-text="employee.email" e-name="email"
							e-form="rowform" onbeforesave="checkEmail($data)" e-required>
								{{ employee.email || 'empty' }} </span></td>
						<!-- <td><div class="btn-group">
							<button type="button" class="btn btn-default btn"
								ng-click="editEmployee(employee.id);">
								<i class="glyphicon glyphicon-pencil"></i>
							</button>
							<button type="button" class="btn btn-default btn"
								ng-click="deleteEmployee(employee.id);">
								<i class="glyphicon glyphicon-trash"></i>
							</button>
						</div></td> -->
						<td style="white-space: nowrap">
							<!-- form -->
							<form editable-form name="rowform"
								onbeforesave="updateEmployee($data)" ng-show="rowform.$visible"
								class="form-buttons form-inline">
								<button type="submit" ng-disabled="rowform.$waiting"
									class="btn btn-primary">Save</button>
								<button type="button" ng-disabled="rowform.$waiting"
									ng-click="rowform.$cancel()" class="btn btn-default">
									Cancel</button>
							</form>
							<div class="buttons" ng-show="!rowform.$visible">
								<button class="btn btn-primary" ng-click="rowform.$show()">Edit</button>
								<button class="btn btn-danger"
									ng-click="deleteEmployee(employee)">Delete</button>
							</div>
						</td>
					</tr>


				</tbody>
			</table>

		</div>
		<div class="row">

			<div id="employeePaginationFooter"
				class="employeePaginationFooter text-center"></div>


		</div>

	</div>
</div>

