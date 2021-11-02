<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!--  Access the Static Resources without using spring URL -->
<link href="/ABC_Car_Portal/css/style.css" rel="stylesheet" />


</head>

<style>
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, 
pre, form, fieldset, input, textarea, p, blockquote, th, td { 
  padding:0;
  margin:0;}

fieldset, img {border:0}

ol, ul, li {list-style:none}

:focus {outline:none}

body { 
  background: #eee url('https://i.imgur.com/eeQeRmk.png'); /* https://subtlepatterns.com/weave/ */
   font-family: 'Montserrat', sans-serif;
  font-size: 100%;
  line-height: 1;
  font-weight: 700;
  color: black;

}

body, button, input {
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;
  letter-spacing: 1.4px;
  color: #ffff;
}

.background {
  display: flex;
  min-height: 100vh;
}

p {
  font-size: 12px;
  width: 150px;
  display: inline-block;
  margin-left: 18px;
}
h1 {
  font-size: 32px;
  font-weight: 300;
  color: #ffff;
  text-align: center;
  padding-top: 10px;
  margin-bottom: 10px;
}


.testbox {
  margin: 20px auto;
  width: 450px;
  height: 464px; 
  -webkit-border-radius: 8px/7px; 
  -moz-border-radius: 8px/7px; 
  border-radius: 8px/7px; 
  background-color: #3e3e3e; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  border: solid 1px #cbc9c9;
}
.screen-body {
  display: flex;
}

.screen-body-item {
  flex: 1;
  padding: 50px;
}
.screen-header {
  display: flex;
  align-items: center;
  padding: 10px 20px;
  background: #4d4d4f;
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
}



.screen-header-button {
  display: inline-block;
  width: 8px;
  height: 8px;
  margin-right: 3px;
  border-radius: 8px;
  background: white;
}

.screen-header-button.close {
  background: #ed1c6f;
}

.screen-header-button.maximize {
  background: #e8e925;
}

.screen-header-button.minimize {
  background: #74c54f;
}

.screen-header-right {
  display: flex;
}

.screen-header-ellipsis {
  width: 3px;
  height: 3px;
  margin-left: 2px;
  border-radius: 8px;
  background: #999;
}

input[type=radio] {
  visibility: hidden;
}

form{
  margin: 0 30px;
}

label.radio {
	cursor: pointer;
  text-indent: 35px;
  overflow: visible;
  display: inline-block;
  position: relative;
  margin-bottom: 15px;
}


input[type=radio]:checked + label:after {
	opacity: 1;
}

hr{
  color: #a9a9a9;
  opacity: 0.3;
}


.accounttype{
  margin-left: 8px;
  margin-top: 20px;
}

a.button {
  font-size: 14px;
  font-weight: 600;
  color: white;
  padding: 6px 25px 0px 20px;
  margin: 10px 8px 20px 0px;
  display: inline-block;
  float: right;
  text-decoration: none;
  width: 50px; height: 27px; 
  -webkit-border-radius: 5px; 
  -moz-border-radius: 5px; 
  border-radius: 5px; 
  background-color: #3a57af; 
  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
  box-shadow: 0 3px rgba(58,87,175,.75);
  transition: all 0.1s linear 0s; 
  top: 0px;
  position: relative;
}

a.button:hover {
  top: 3px;
  background-color:#2e458b;
  -webkit-box-shadow: none; 
  -moz-box-shadow: none; 
  box-shadow: none;
  
}


</style>



<body>

	<!-- Test My JS -->
	<!-- <input type="button" class="button" onclick="sayHello();" value="Click me!">  -->

	<%@ include file="header.jsp"%>


	

	<!-- First Container -->
	<div class="container-fluid bg-1">
	
		<div class="row">

		
		<h3 class="margin text-center">Detail Car Information !</h3>

			<div class="col-md-8">
				<div class="screen-header">
		 			<div class="screen-header-button close"></div>
     				<div class="screen-header-button maximize"></div>
     				<div class="screen-header-button minimize"></div>
				</div>

				<form:form class="form-horizontal">

					<div class="form-group">
						<label for="id" class="control-label col-sm-4">ID: </label>
						<div class="col-sm-8">${car.id}</div>
					</div>


					<div class="form-group">
						<label for="make" class="control-label col-sm-4">Car Make:
						</label>
						<div class="col-sm-8">${car.make}</div>
					</div>

					<div class="form-group">
						<label for="model" class="control-label col-sm-4">Car
							Model: </label>
						<div class="col-sm-8">${car.model}</div>
					</div>

					<div class="form-group">
						<label for="reg" class="control-label col-sm-4">Reg No: </label>
						<div class="col-sm-8">${car.registeration}</div>
					</div>

					<div class="form-group">
						<label for="price" class="control-label col-sm-4">Price: </label>
						<div class="col-sm-8">${car.price}</div>
					</div>

					<hr />

					<div class="form-group">
						<label for="price" class="control-label col-sm-4"> <img
							src="https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png" width="60px" alt="..."></label>
						<div class="col-sm-8" style="padding: 20px;">

							<form action="car_detail?id=${car.id}" method="post">
								<input type="hidden" name="id" value="${car.id}" /> <input
									type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="number"
									placeholder="Enter Bid Price" name="bitprice" />

								<div class="form-group" style="padding: 20px;">
									<input type="submit" value="Bit Car" class="btn btn-success">
									<a href="cars" class="btn btn-danger">Go Back</a>
								</div>

							</form>
						</div>

					</div>

					<script>
						function goBack() {
							window.history.back();
						}
					</script>

				</form:form>


			</div>

			<div class="col-md-3 bg-3">
				<h4> Current Bidding Price!</h4><br/>
			<c:forEach var="car_bidding" items="${bidinfo}">
				
				<div class="card mb-3 card bg-info" style="padding:10px;">
				
					<div class="row" >
						<div class="col-md-4">
							<img class="card-img-top"
							src="https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png" width="30px" class="rounded-circle"
							class="mr-3" alt="...">
							<p>${car_bidding.bidderName}</p>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<p class="card-head"><small class="text-muted">${car_bidding.bid_date_time}</small></p>
								<p class="card-text">Bidded Price: ${car_bidding.bidderPrice}</p>
						
							</div>
						</div>
					</div>
				</div>
				
				<hr/>
			</c:forEach>

			</div>


		</div>

	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
