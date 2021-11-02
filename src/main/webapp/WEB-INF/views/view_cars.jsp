<%@ page contentType="text/html; charset=US-ASCII"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
body { 
  background: #eee url('https://i.imgur.com/eeQeRmk.png'); /* https://subtlepatterns.com/weave/ */
   font-family: 'Montserrat', sans-serif;
  font-size: 100%;
  line-height: 1;
  font-weight: 700;
  color: black;

}

::selection { background: #5f74a0; color: #fff; }
::-moz-selection { background: #5f74a0; color: #fff; }
::-webkit-selection { background: #5f74a0; color: #fff; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

h1 { 
  font-family: 'Amarante', Tahoma, sans-serif;
  font-weight: bold;
  font-size: 3.6em;
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
}


/** page structure **/
#wrapper {
  display: block;
  width: 1000px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 15px;
}


#keywords thead {
  cursor: pointer;
  background: #c9dff0;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url('https://i.imgur.com/SP99ZPJ.png');
}
#keywords thead tr th.headerSortDown span {
  background-image: url('https://i.imgur.com/RkA9MBo.png');
}


#keywords tbody tr { 
  color: #555;
}
#keywords tbody tr td {
  text-align: center;
  padding: 15px 10px;
}
#keywords tbody tr td.lalign {
  text-align: left;
}

/* Banner Section */
.banner {
  text-align: left;
}
@media(min-width: 320px) {
	.photo-banner {
		display: none;
	}
	.descr-banner {
		display: block;
		text-align: center;
		padding: 50px 0 60px 0;
	}
}
@media(min-width: 768px) {
	.photo-banner, .descr-banner {
		display: inline-block;
		vertical-align: top;
	}
	.photo-banner {
		width: 50%;
		padding-top: 64px;
		margin-left: 0;
		line-height: 0;
	}
	.descr-banner {
	text-align: left;
	  padding-left: 60px;
	  padding-top: 45px;
	}
}
.slash {
  color: #e74c3c;
}

p {
  margin-bottom: 30px;
}
@media(min-width: 1200px) {
	.photo-banner {
		margin-left: 100px;
	}
	.descr-banner {
	  padding-left: 90px;
	  padding-top: 135px;
	}
}

</style>

<body>

	<%@ include file="header.jsp"%>
	
	
<div class="container-fluid bg-1">
	
		<!-- Banner -->
			<section class="banner container">
					<div class="photo-banner">
						<img src="https://i.pinimg.com/originals/87/18/b7/8718b7de2534c4e5dd9b3a788818af0c.jpg" alt="banner ">
					</div>
					<div class="descr-banner">
						<h4>CarsDeals helps you get a great deal<br> on a used
						car by giving you up-to-the<br>-minute car pricing information<br> so that
						you're fully armed <br>with the knowledge you <br> need as you shop for a <br>
						car.</h4>
						
						
					<sec:authorize access="hasRole('Users')">
					<a href="new_car">
						<button class="btn btn-primary">Post A Car For Sale</button>
					</a>	
					</sec:authorize>
						
					</div>
			</section>


			<div>		

			<c:if test="${not empty error_message}">
				<p>${error_message}</p>
			</c:if>

			<c:if test="${empty cars}">
				<sec:authorize access="hasRole('Administrator')">
					<span> No Cars are added yet. </span>
				</sec:authorize>
				<sec:authorize access="hasRole('Users')">
					<span> Please click on Add button to add Cars to the system.
					</span>
				</sec:authorize>
			</c:if>


			<!--  All Car Lists  -->
			<br>
			<div class="row">

			<c:url var="get_search_url" value="search"/>
				<form action="${get_search_url}" id="myform" method="get" class="form-inline text-right" style="padding:20px;">

						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" value="" name="keyword" />

						<input type="submit" value="Search" class="btn btn-info"/>

					</form>

			</div>
			<br>
		
				<div id="wrapper">
 				 <h1>Car List</h1>
  						<c:if test="${not empty cars}">
  					<table id="keywords" cellspacing="0" cellpadding="0">
    				<thead>
							<tr>
								<th>No.</th>
								<th>Car ID</th>
								<th>Car Make</th>
								<th>Model</th>
								<th>Reg No.</th>
								<th>Price</th>
								<th>Actions</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="car" items="${cars}">
						
							<tr>
								<td><%=i %></td>
								<td>${car.id}</td>
								<td>${car.make}</td>
								<td>${car.model}</td>
								<td>${car.registeration}</td>
								<td>${car.price} </td>

								<td>
								
								<sec:authorize access="hasRole('Administrator')">
									<a href="edit?id=${car.id}">
										<button class="btn btn-success">Update</button>
									</a>
									<a href="delete?id=${car.id}">
										<button class="btn btn-danger">Delete</button>
									</a>
								</sec:authorize>
								
									<a href="car_detail?id=${car.id}">
									<button class="btn btn-info">View </button>
									</a>
								</td>
							</tr>
							<% i++; %>
						</c:forEach>

						</tbody>
					</table>
					
					</c:if>
					
				</div>
			</div>
			
			<!--  End Car Lists  -->

		</div>




	<%@ include file="footer.jsp"%>
	
	</body>
	</html>