<?php  
session_start();
include '../inc/header.php';
$sql = "SELECT * FROM `categories`";
$result = mysqli_query($connection , $sql)

?>

<?php if(isset($_SESSION['passed'])):?>
        <div class="alert alert-success text-center"><?= $_SESSION['passed'] ?></div>
<?php endif;?>

    <div class="container">
        <div class="row">
            <div class="col-lg-9 mx-auto">
                <form action="../handlers/store.php" method="POST" class="border p-5 mt-5" enctype="multipart/form-data">
                    <div class="form-group">
                        <label  class="form-label">categories</label>
                        <select class="form-control" name ="cat_N">
                             <option value = "" selected disabled>----</option>
                            <?php if(mysqli_num_rows($result)) :?>
                                <?php while($rows = mysqli_fetch_assoc($result)) :?>
                                    <option value="<?=$rows['id_category']?>"><?=$rows['name_category']?></option>
                                <?php endwhile;?>
                            <?php endif;?>
                        </select>
                        <div  class="form-text text-danger">
                            <?php echo isset($_SESSION['errors']['category'])? $_SESSION['errors']['category']: '';?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="form-label">NAME</label>
                        <input type="text" class="form-control" name ="pro_N">
                        <div  class="form-text text-danger">
                            <?php echo isset($_SESSION['errors']['name'])? $_SESSION['errors']['name']: '';?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="form-label">PRICE</label>
                        <input type="number" class="form-control" name ="pro_P">
                        <div  class="form-text text-danger">
                            <?php echo isset($_SESSION['errors']['price'])? $_SESSION['errors']['price']: '';?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="form-label">QUANTITY</label>
                        <input type="number" class="form-control" name ="pro_Q">
                        <div  class="form-text text-danger">
                            <?php echo isset($_SESSION['errors']['quantity'])? $_SESSION['errors']['quantity']: '';?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label">IMAGE</label>
                        <input type="file" class="form-control" name ="pro_F" accept="image/*,.pdf">
                        <div  class="form-text text-danger">
                        <?php echo isset($_SESSION['errors']['file'])? $_SESSION['errors']['file']: '';?>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="submit" class="btn btn-primary mt-2">save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php unset($_SESSION['errors'])?>
<?php unset($_SESSION['success'])?>
<?php unset($_SESSION['passed'])?>
<?php  include '../inc/footer.php'?>