SpringApp.factory("BaseService", function($http) {

	return {

		getEmployees : function($scope, currentPage) {

			$.get(contextPath + "/getEmployees?currentPage=" + currentPage,
					function(dataWrapper, status) {
						pageLoaderAPI(false);
						$scope.$apply(function() {
							$scope.dataWrapper = dataWrapper;
							if ($scope.dataWrapper && $scope.dataWrapper.data
									&& $scope.dataWrapper.data.length > 0) {
								$("#employeePaginationFooter").unbind();
								employeePaginationFooter(
										dataWrapper.pageNumber,
										dataWrapper.pageSize,
										dataWrapper.totalPages,
										dataWrapper.totalElement);
							} else {
								$('#employeePaginationFooter').html('');

							}
						});

					});
		},
		addEmployee : function($scope) {
			var employee = $scope.newEmployee;
			if (!hasValueStr(employee.firstName)
					|| !hasValueStr(employee.lastName)) {
				alert("First Name & Last Name can not be blank!");
				return;
			}
			if (!validateEmail(employee.email)) {
				alert("Email invalid!");
				return;
			}
			pageLoaderAPI(true);
			$.ajax({
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json",
				},
				type : "POST",
				url : "addEmployee",
				data : JSON.stringify(employee),
				dataType : "json",
				success : function(response) {
					pageLoaderAPI(false);
					if (response.httpStatus == 200) {
						$scope.getEmployees($scope.dataWrapper.pageNumber);
						$scope.$apply(function() {
							$scope.newEmployee = {
								id : null,
								firstName : "",
								lastName : "",
								email : ""
							};
						});

					} else {
						alert(response.message);
						$scope.getEmployees($scope.dataWrapper.pageNumber);
					}

				},
				error : function(e) {
					alert("error");
					pageLoaderAPI(false);
				},
				done : function(e) {
					alert("done");
					pageLoaderAPI(false);
				}
			});
		},

		updateEmployee : function($scope, employee) {

			if (!hasValueStr(employee.firstName)
					|| !hasValueStr(employee.lastName)) {
				alert("First Name & Last Name can not be blank!");
				return;
			}
			if (!validateEmail(employee.email)) {
				alert("Email invalid!");
				return;
			}
			pageLoaderAPI(true);
			$.ajax({
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json",
				},
				type : "PUT",
				url : "updateEmployee",
				data : JSON.stringify(employee),
				dataType : "json",
				success : function(response) {
					pageLoaderAPI(false);
					if (response.httpStatus == 200) {
						$scope.getEmployees($scope.dataWrapper.pageNumber);
					} else {

						alert(response.message);
						$scope.getEmployees($scope.dataWrapper.pageNumber);
					}

				},
				error : function(e) {
					alert("error");
					pageLoaderAPI(false);
				},
				done : function(e) {
					alert("done");
					pageLoaderAPI(false);
				}
			});
		},
		deleteEmployee : function($scope, employee) {

			pageLoaderAPI(true);
			$.ajax({
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json",
				},
				type : "DELETE",
				url : "deleteEmployee/" + (employee.id),
				// data : JSON.stringify(employee),
				dataType : "json",
				success : function(response) {
					pageLoaderAPI(false);
					if (response.httpStatus == 200) {
						var dataWrapper = $scope.dataWrapper;

						if (dataWrapper.data.length == 1) {
							$scope.getEmployees(dataWrapper.pageNumber - 1);
						} else {

							$scope.getEmployees(dataWrapper.pageNumber);
						}

					} else {
						alert(response.message);
						$scope.getEmployees(dataWrapper.pageNumber);
					}

				},
				error : function(e) {
					alert("error");
					pageLoaderAPI(false);
				},
				done : function(e) {
					alert("done");
					pageLoaderAPI(false);
				}
			});
		},

	};
});

SpringApp.controller('ManagementController', [ '$scope', '$http',
		'BaseService', '$timeout',
		function($scope, $http, BaseService, $timeout) {

			$scope.dataShow = "";

			getManagementData(firstURL);
		} ]);

SpringApp.controller('EmployeeController', [ '$scope', '$http', 'BaseService',
		'$timeout', function($scope, $http, BaseService, $timeout) {

			$scope.employeeList = [];
			BaseService.getEmployees($scope, 0);
			$scope.newEmployee = {
				id : null,
				firstName : "",
				lastName : "",
				email : ""
			};
			$scope.checkEmail = function(email) {

				// alert(data);
				if (!validateEmail(email)) {
					return 'Email invalid!';
				}
			};

			$scope.getEmployees = function(currentPage) {
				BaseService.getEmployees($scope, currentPage);
			};

			$scope.addEmployee = function() {
				BaseService.addEmployee($scope);
			};

			$scope.updateEmployee = function(employee) {
				BaseService.updateEmployee($scope, employee);
			};

			$scope.deleteEmployee = function(employee) {
				BaseService.deleteEmployee($scope, employee);
			};

		} ]);