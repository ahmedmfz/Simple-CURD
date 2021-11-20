<?php 
session_start();
include '../inc/header.php';
$sql = "SELECT * FROM `products` INNER JOIN `categories` ON categories.id_category = products.category_id;";
$result = mysqli_query($connection , $sql);

?>

<?php if(isset($_SESSION['delete'])):?>
    <div class="alert alert-danger text-center"><?= $_SESSION['delete']?></div>
<?php endif;?>

<?php if(isset($_SESSION['passed'])):?>
    <div class="alert alert-success text-center"><?= $_SESSION['passed'] ?></div>
<?php endif;?>


    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <table class="table mt-5 text-center">
                    <thead>
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col">name</th>
                        <th scope="col">price</th>
                        <th scope="col">quantity</th>
                        <th scope="col">category</th>
                        <th scope="col">image</th>
                        <th scope="col">action</th>
                        </tr>
                    </thead>
                    <tbody>
                         <?php $i = 1;if(mysqli_num_rows($result)): ?>
                            <?php while($rows = mysqli_fetch_assoc($result)) :?>
                                <tr>
                                    <th scope="row"><?=$i++?></th>
                                    <td><?= $rows['name_product']?></td>
                                    <td><?= $rows['price']?></td>
                                    <td><?= $rows['qty']?></td>
                                    <td><?= $rows['name_category']?></td>
                                    <td><img src="../files/<?= $rows['image']?>" alt="" style="width:100px"></td>
                                    <td>
                                        <a href="edit.php?id=<?=$rows['id_product']?>" class="btn btn-info"> Edit</a>
                                        <a href="../handlers/delete.php?id=<?=$rows['id_product']?>" class="btn btn-danger"> delete</a>
                                    </td>
                                </tr>
                            <?php endwhile;?>
                        <?php endif;?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<?php unset($_SESSION['passed']); ?>
<?php unset($_SESSION['delete']); ?>
<?php  include '../inc/footer.php'?>