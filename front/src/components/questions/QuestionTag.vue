<template>
  <div>
    <div class="relative inline-block text-left ml-2">
      <div class="bold">ジャンルから選択</div>
      <div v-for="tag in tags" :key="tag.id">
        <div
          class="
            origin-top-right
            right-0
            mt-2
            w-56
            rounded-md
            shadow-lg
            bg-white
            dark:bg-gray-800
            ring-1 ring-black ring-opacity-5
          "
        >
          <div class="py-1">
            <a
              href="#"
              class="
                block block
                px-4
                py-2
                text-md text-gray-700
                hover:bg-gray-100
                hover:text-gray-900
                dark:text-gray-100
                dark:hover:text-white
                dark:hover:bg-gray-600
              "
            >
              <span class="flex flex-col">
                <span>
                  {{ tag.name }}
                </span>
              </span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      tags: [],
    };
  },
  created() {
    axios
      .get("api/v1/tags")
      .then((response) => {
        this.tags = response.data;

        console.log(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>
