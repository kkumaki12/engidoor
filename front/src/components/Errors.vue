<template>
  <div
    v-if="alert == true"
    class="text-white px-6 py-4 border-0 rounded relative mb-4 bg-red-500"
  >
    <span class="text-xl inline-block mr-5 align-middle">
      <font-awesome-icon :icon="['fas', 'bell']" />
    </span>
    <span class="inline-block align-middle mr-8">
      <b class="capitalize">{{ errors }}</b>
    </span>
  </div>
</template>
