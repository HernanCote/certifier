<template>
  <div class="addCourse">
    <h2>Certifier</h2>
    <form @submit.prevents="save" v-if="isOwner">
      <div class="form-group">
        <label for="codeCourse">Course Code</label>
        <input type="text" class="form-control" id="courseCode" placeholder="Add Course Code" v-model="form.courseCode">
      </div>
      <div class="form-group">
        <label for="courseName">Course Name</label>
        <input type="text" class="form-control" id="courseName" placeholder="Add Course Name" v-model="form.courseName">
      </div>
      <div class="form-group">
        <label for="courseCost">Course Cost</label>
        <input type="number" class="form-control" id="courseCost" placeholder="Add Course Cost" v-model="form.courseCost">
      </div>
      <div class="form-group">
        <label for="courseDuration">Course Duration</label>
        <input type="number" class="form-control" id="courseCuration" placeholder="Add Course Duration in hours" v-model="form.courseDuration">
      </div>
      <div class="form-group">
        <label for="threshold">Course Threshold</label>
        <input type="number" class="form-control" id="threshold" placeholder="Add Course Threshold" v-model="form.courseThreshold">
      </div>
      <div class="form-group">
      <button type="button" @click="sessions == 10 ? null : sessions++ " class="btn btn-primary">Add Session</button>
      &nbsp;
      <button type="button" @click="sessions == 1 ? null : sessions--" class="btn btn-danger">Remove Session</button>
      <br/>
      <br/>
        <div class="form-group" v-for="(code, idx) in sessions" v-if="sessions">
          <input type="text" class="form-control" :placeholder="`Session ${code}`" v-model="form.codes[index]">
        </div>        
      <button type="submit" class="btn btn-success">Submit</button>
      </div>
    </form>
     <div class="alert alert-danger" role="alert" v-else>
      You are not the contract owner
    </div>
  </div>
</template>

<script>
import { mapActions, mapState } from "vuex";
import * as constants from "@/store/constants";

export default {
  name: "addCourse",
  data() {
    return {
      sessions: 0,
      form: {
        courseCode: null,
        courseName: null,
        courseCost: null,
        courseDuration: null,
        courseThreshold: null,
        codes: []
      }
    };
  },
  computed: {
    ...mapState({
      isOwner: state => state.Course.isOwner
    })
  },
  methods: {
    ...mapActions({
      init: constants.COURSE_INIT
    }),
    save() {
      console.log(":)");
    }
  },
  created() {
    this.init();
  }
};
</script>
