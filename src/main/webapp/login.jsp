
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Login</title>

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

    
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/5.0/examples/sign-in/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
	<form method="post" action="/RubricaWebMaven/LoginServlet">
	    <img class="mb-4" src="https://svgshare.com/i/Y0J.svg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">RubricaWeb</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name="username" placeholder="Inserisci username">
	      <label for="floatingInput">Username</label>
	    </div>
	    <div class="form-floating mt-1">
	      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password"> 
	      <label for="floatingPassword">Password</label>
	    </div>
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
	    <button class="w-100 btn btn-lg btn-primary mt-1" type="reset">Reset</button>
  </form>
</main>


    
  </body>
</html>

