<template>
  <main class="w-full flex justify-center mt-24">
    <div class="flex flex-col md:w-3/5 p-3 space-y-5 rounded-xl border border-black bg-white shadow-md">
        <section class="font-bold text-lg text-blue-900">
            <div class="w-16 h-16 rounded-full">
            </div>
            さん
            <div class="text-right mr-5">
                回答数
            </div>
        </section>
        <section class="text-sm font-thin text-orange-400">
            
        </section>
        <section class="text-3xl font-bold">
            
        </section>
        <section class="font-normal text-md text-gray-700">
            
        </section>
        <section class="font-normal text-md text-gray800">
            
            <ul></ul>
            
        </section>

        <section class="flex justify-end">
            <button type="button" class="bg-red-600 text-white px-3 py-1 rounded-md">

            </button>
        </section>
    </div>
</main>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return{
      questions: []
    };
  },
  created() {
    axios.get('/api/v1/questions', {questions: this.questions})
    .then(response => {
      console.log(response);
    });
  }
}
</script>

