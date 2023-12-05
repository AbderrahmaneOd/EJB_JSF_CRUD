<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Gestion des Hotels</title>
<!-- Inclure les fichiers Bootstrap via CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>


</head>
<body>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Gestion hôtelière</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="hotel.jsp">Hôtel</a></li>
					<li class="nav-item"><a class="nav-link" href="ville.jsp">Ville</a></li>
					<li class="nav-item"><a class="nav-link" href="hotelByVille.jsp">Rechercher</a></li>

				</ul>

			</div>
		</div>
	</nav>


	<div class="container-fluid d-flex justify-content-center">
		<div
			class="container mt-5 p-3 w-60 border border-black border-1 rounded">
			<h2 class="mb-4">Gestion Hôtel</h2>
			<!-- Create form -->
			<form id="createForm" action="HotelController" method="post">
				<div class="form-group">
					<input type="text" class="form-control m-2" name="nom"
						placeholder="nom" required> <input type="text"
						class="form-control m-2" name="adresse" placeholder="adresse"
						required> <input type="text" class="form-control m-2"
						name="telephone" placeholder="telephone" required>

					<c:if test="${not empty villes}">
							<label for="ville">Ville</label>
							<select name="ville"
								class="form-control">
								<c:forEach items="${villes}" var="v">
									<option value="${v.id}">${v.nom}</option>
								</c:forEach>
							</select>
					</c:if>

				</div>
				<button name="action" value="add" class="btn btn-primary mt-3">Create</button>
			</form>


		</div>
	</div>

	<div class="container mt-2 w-60 border border-black border-1 rounded">
		<!-- Table to display Hotel instances -->
		<table class="table mt-4">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nom</th>
					<th>Address</th>
					<th>Telephone</th>
					<th>Ville</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody id="hotelList">
				<!-- Display Hotel instances here -->
				<c:forEach items="${Hotels}" var="v">
					<tr>
						<td>${v.id}</td>
						<td>${v.nom}</td>
						<td>${v.adresse}</td>
						<td>${v.telephone}</td>
						<td>${v.ville.nom}</td>
						<td>
							<!-- Actions for each Hotel -->
							<div class="d-flex flex-row">
								<div class="p-2">
									<form action="HotelController" method="post">
										<input type="hidden" name="action" value="delete"> <input
											type="hidden" name="id" value="${v.id}">
										<button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
									</form>
								</div>


								<div class="p-2">
									<form action="VilleController" method="get">
										<input type="hidden" name="action" value="edit"> <input
											type="hidden" name="id" value="${v.id}">
										<button type="submit" class="btn btn-primary btn-sm">Modifier</button>
									</form>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>

</body>
</html>
