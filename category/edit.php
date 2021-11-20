<?php
session_start();
include '../inc/header.php';

$sql_category = "SELECT * FROM `categories`";
$result_category = mysqli_query($connection, $sql_category);

if (isset($_GET['id'])) :
    $id = $_GET['id'];
elseif (isset($_SESSION['id'])) :
    $id = $_SESSION['id'];
endif;


$sql_product = "SELECT * FROM `products` INNER JOIN `categories` 
        ON categories.id_category = products.category_id 
        WHERE `id_product` = '$id'";
$result_product = mysqli_query($connection, $sql_product);
$products = mysqli_fetch_assoc($result_product);

?>

<?php if (isset($_SESSION['passed'])) : ?>
    <div class="alert alert-success text-center"><?= $_SESSION['passed'] ?></div>
<?php endif; ?>

<div class="container">
    <div class="row">
        <div class="col-lg-9 mx-auto">
            <form action="../handlers/update.php?id=<?=$products['id_product']?>" method="POST" class="border p-5 mt-5" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="form-label">categories</label>
                    <select class="form-control" name="cat_N">
                        <option value="<?= $products['category_id'] ?>" selected ><?= $products['name_category'] ?></option>
                            <?php while ($categorys  = mysqli_fetch_assoc($result_category)) : ?>
                                <option value="<?= $categorys['id_category'] ?>"><?= $categorys['name_category'] ?></option>
                            <?php endwhile; ?>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">NAME</label>
                    <input type="text" class="form-control" name="pro_N" value="<?=$products['name_product']?>">
                    <div class="form-text text-danger">
                        <?php echo isset($_SESSION['errors']['name']) ? $_SESSION['errors']['name'] : ''; ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">PRICE</label>
                    <input type="number" class="form-control" name="pro_P" value="<?=$products['price']?>">
                    <div class="form-text text-danger">
                        <?php echo isset($_SESSION['errors']['price']) ? $_SESSION['errors']['price'] : ''; ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">QUANTITY</label>
                    <input type="number" class="form-control" name="pro_Q" value="<?=$products['qty']?>">
                    <div class="form-text text-danger">
                        <?php echo isset($_SESSION['errors']['quantity']) ? $_SESSION['errors']['quantity'] : ''; ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">IMAGE</label>
                    <input type="file" class="form-control" name="pro_F" accept="image/*,.pdf">
                    <div class="form-text text-danger">
                        <?php echo isset($_SESSION['errors']['file']) ? $_SESSION['errors']['file'] : ''; ?>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-warning mt-2">update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php unset($_SESSION['errors']) ?>
<?php unset($_SESSION['success']) ?>
<?php unset($_SESSION['passed']) ?>
<?php include '../inc/footer.php' ?>