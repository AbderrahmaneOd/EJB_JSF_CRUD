<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifier ville</title>
<!-- Inclure les fichiers Bootstrap via CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
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
        <h1 class="text-center mb-4">Modifier ville</h1>

        <!-- Form to add a new city -->
        <form class="custom_class" action="VilleController" method="post" class="form-inline mb-3">
            <div class="form-group mr-2">
                <label for="villeInput" class="sr-only">Nom :</label>
                <input type="text" name="ville" class="form-control" id="villeInput" placeholder="Enter city name" value="${editVille != null ? editVille.nom : ''}" required>
            </div>
            <input type="hidden" name="action" value="${editVille != null ? 'update' : 'create'}">
            <input type="hidden" name="id" value="${editVille != null ? editVille.id : ''}">
            <button type="submit" class="btn btn-primary">${editVille != null ? 'Update' : 'Enregistrer'}</button>
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
</html>