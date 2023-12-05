<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifier Hotel</title>
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

    <div class="container">
        <h1 class="text-center mb-4">Edit Hotel</h1>

        <!-- Form to add a new city -->
        <form class="custom_class" action="HotelController" method="post" class="form-inline mb-3">
            <div class="form-group">
                <label for="hotelNameInput">Nom :</label>
                <input type="text" name="nom" class="form-control" id="hotelNameInput" placeholder="Enter hotel name" value="${editHotel != null ? editHotel.nom : ''}" required>
            </div>
            <div class="form-group">
                <label for="hotelAddressInput">Adresse :</label>
                <input type="text" name="adresse" class="form-control" id="hotelAddressInput" placeholder="Enter hotel address" value="${editHotel != null ? editHotel.adresse : ''}" required>
            </div>
            
            <div class="form-group">
                <label for="hotelTelephoneInput">Telephone :</label>
                <input type="text" name="telephone" class="form-control" id="hotelTelephoneInput" placeholder="Enter hotel telephone" value="${editHotel != null ? editHotel.telephone : ''}" required>
            </div>

            <c:if test="${not empty villes}">
                <div class="form-group">
                    <label for="hotelVilleSelect">Ville :</label>
                    <select name="ville" class="form-control" id="hotelVilleSelect">
                        <c:forEach items="${villes}" var="v">
                            <option value="${v.id}" ${editHotel != null && editHotel.ville.id == v.id ? 'selected' : ''}>${v.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>

            <input type="hidden" name="action" value="${editHotel != null ? 'update' : 'create'}">
            <input type="hidden" name="id" value="${editHotel != null ? editHotel.id : ''}">
            <button type="submit" class="btn btn-primary">${editHotel != null ? 'Update' : 'Enregistrer'}</button>
        </form>

    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Ville and associated hotels?");
        }
    </script>
</body>
</body>
</html>