<template>
    <div class="home">
        <div class="card" style="width: 18rem;">
            <img class="card-img-top mx-auto d-block" src="../img/add-list-icon-25.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Add Course</h5>
                <p class="card-text">Add a Course to the Course Catalog</p>
                <router-link to="/course" class="btn btn-primary">Go</router-link>
            </div>
        </div>
    </div>
</template>

<script>
export default {
  name: "Home"
};
</script>

<style scoped>
.card-img-top {
  text-align: center;
  max-height: 150px;
  margin-top: 20px;
  width: 50%;
}

.home {
  margin-top: 50px;
}
</style>

    
