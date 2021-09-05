<template>
    <div class="border bg-white">
      <div v-for="user in users" :key="user.id">
        <li class="mt-2">
          <b>{{ users.indexOf(user) + 1 }}位</b>
          <router-link :to="{ name: 'UserShow', params: { id: user.id } }">
            {{ user.name }}さん
          </router-link>
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
</template>

<script>

export default {
  props: {
    users: Array,
  },
};
</script>
