<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Inclure les fichiers Bootstrap via CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</head>
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

    <div class="container">
        <form class="my_form" action="HotelController" method=get>
        <input type="hidden" name="action" value="byVille">
            
            <c:if test="${not empty villes}">
                <div class="form-group">
                    <label for="ville">Ville :</label>
                    <select name="ville" class="form-control">
                        <c:forEach items="${villes}" var="v">
                            <option value="${v.id}">${v.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>

            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </form>

        <!-- Table to showcase hotel information -->
<h2 class="text-center mt-4">Liste des Hôtels :</h2>
<table class="table mt-4">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse</th>
            <th>Telephone</th>
            <th>Ville</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <!-- Add a loop to iterate over the list of hotels -->
        <c:forEach items="${Hotels}" var="hotel">
            <tr>
                <td>${hotel.id}</td>
                <td>${hotel.nom}</td>
                <td>${hotel.adresse}</td>
                <td>${hotel.telephone}</td>
                <td>${hotel.ville.nom}</td>
                <td>
                   <!-- Actions for each Hotel -->
							<div class="d-flex flex-row">
								<div class="p-2">
									<form action="HotelController" method="post">
										<input type="hidden" name="action" value="delete"> <input
											type="hidden" name="id" value="${hotel.id}">
										<button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
									</form>
								</div>


								<div class="p-2">
									<form action="VilleController" method="get">
										<input type="hidden" name="action" value="edit"> <input
											type="hidden" name="id" value="${hotel.id}">
										<button type="submit" class="btn btn-primary btn-sm">Modifier</button>
									</form>
								</div>
							</div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this hotel?");
    }
</script>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>