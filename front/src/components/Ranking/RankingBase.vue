<template>
  <div class="border bg-white">
    <div class="container px-5 mx-auto divide-y-2 divide-gray-500">
      <div v-for="user in users" :key="user.id">
        <li class="mt-2">
          <div class="text-center text-gray-600 font-bold text-sm">
            <b>{{ users.indexOf(user) + 1 }}位</b>
            <router-link
              :to="{ name: 'UserShow', params: { id: user.id } }"
              class="text-gray-600 font-bold text-sm hover:underline"
            >
              {{ user.name }}さん
            </router-link>
          </div>
          <img
            v-if="user.image.url"
            :src="user.image.url"
            class="w-16 h-16 rounded-full"
          />
          <img
            v-else
            src="../../assets/default.png"
            class="rounded-full w-16 h-16"
            alt="ユーザーアイコン"
          />
        </li>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    users: Array,
  },
};
</script>
