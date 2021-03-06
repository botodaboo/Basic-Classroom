<?php
    session_start();
    require_once('connect.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <script src='main.js'></script>

    <title>STREAM</title>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
  <?php
    $result = getClassTeacherById($_GET['id']);
    $error = null;
    if(isset($_GET['id']) && isset($_POST['email']))
    {
        $classID = $_GET['id'];
        $teacherEmail = $_GET['teacherEmail'];
        $email = $_POST['email'];
        if(empty($email))
        {
          $error = 'Please enter student\'s email!';
        }
        else
        {
          $resultAdd = addStudent($email, $classID);
          if ($resultAdd['code'] != 0)
          {
            $error = $resultAdd['error'];
          }
          else
          {
            header("Location: peopleTeacher.php?id=$classID&teacherEmail=$teacherEmail");
          }
        }
      }
  ?>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    <nav class="navbar fixed-top navbar-expand-sm navbar-light">
        
        <a class="navbar-brand mb-0 navname" href="#"><?=$result['classname']?></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        
        
        
    </nav>

    <div class="container">
        <div class="row">
          <div class="col-sm-12 pt-5">
            <div class="card classbg bg-primary">
              <h1><?=$result['lastname'] . ' ' . $result['firstname']?></h1>
              <h4><?=$result['subject'] . '_' . $result['room']?></h4>
            </div>
          </div>
        </div> 

        <div class="row">
          <div class="col-lg-3">
              
          </div>
          <div class="col-lg-6">
              <div class="add">
                  <h1>Th??m sinh vi??n v??o l???p h???c</h1>
              </div>
            <form action="" method='POST'>
                <div class="row">
                  <div class="col-25">
                    <label for="fname">Nh???p email: </label>
                  </div>
                  <div class="col-75">
                    <input type="email"  name="email" placeholder="Nh???p email">
                  </div>
                </div>
                
                <?php
                  if (!empty($error))
                  {
                ?>
                <div class="row">
                  <div style='color:red' class='alert alert-danger'><?=$error?></div>
                </div>
                <?php
                  }
                ?>
                <div class="row">
                  <input type="submit" value="Add" class="col-lg-3">
                  <span class="col-lg-6"></span>
                </div>
              </form>
              
              
              
              <div class="row">
                <div class="col-lg-3">
                  <a class="btn btn-primary" href="peopleTeacher.php?id=<?=$_GET['id']?>&teacherEmail=<?=$_GET['teacherEmail']?>">Back</a>
                </div>
              </div>
            
          </div>
          <div class="col-lg-3">
          
          </div>
        </div>     
    </div>

      <div class="tab-content">
          <div id="homesrc" class="container tab-pane active"><br>
          </div>
          <div id="classworksrc" class="container tab-pane fade"><br>
          </div>
          <div id="peoplesrc" class="container tab-pane fade"><br>
          </div>
      </div>

      

  
</body>
</html>