<template>
  <div class="col-span-12 lg:col-span-8">
                <div
                  v-if="question.best_answer"
                  class="
                    inline-block
                    rounded-full
                    text-white
                    bg-red-400
                    duration-300
                    text-xs
                    font-bold
                    mr-1
                    md:mr-2
                    mb-2
                    px-2
                    md:px-4
                    py-1
                    opacity-90
                  "
                >
                  解決済
                </div>
                <div
                  v-else
                  href="#"
                  class="
                    inline-block
                    rounded-full
                    text-white
                    bg-blue-400
                    duration-300
                    text-xs
                    font-bold
                    mr-1
                    md:mr-2
                    mb-2
                    px-2
                    md:px-4
                    py-1
                    opacity-90
                  "
                >
                  回答受付中
                </div>
              </div>
            </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      bestAnswer
    };
  },
  created() {
  axios.get('/bestanswer')

}
</script>
