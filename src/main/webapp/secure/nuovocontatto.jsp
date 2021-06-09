<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Nuovo Contatto</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

  <link href="https://getbootstrap.com/docs/5.0/examples/sign-in/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin" style="margin-top:0">
	<form method="post" action="/RubricaWebMaven/ContactServlet?action=aggiungi">
	    <img class="mb-4" src="https://svgshare.com/i/Y0J.svg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">Aggiungi contatto</h1>
	
	    <input class="form-control form-control-sm" type="text" name="nome" id="nome" placeholder="Nome" aria-label=".form-control-sm example">
	    <input class="form-control form-control-sm mt-1" type="text" name="cognome" id="cognome" placeholder="Cognome" aria-label=".form-control-sm example">
	
	
	    <input class="form-control form-control-sm mt-1" type="email" placeholder="Email" aria-label=".form-control-sm example">
	
	
	    <input class="form-control form-control-sm mt-1" type="text" placeholder="Telefono" aria-label=".form-control-sm example">
	
	    <button class="w-100 btn btn-lg btn-primary btn-sm mt-2" type="submit">Aggiungi Contatto</button>
	    <button class="w-100 btn btn-lg btn-primary btn-sm mt-1" type="reset">Reset</button>
	 </form>
</main>


    
  </body>
</html>
    