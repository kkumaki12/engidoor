<template>
  <div class="col-none hidden mr-2 lg:block lg:col-start-9 lg:col-end-12">
    <div class="flex items-center">
      <div class="w-16 h-16"></div>
    </div>
    <div class="text-gray-600 font-bold text-sm hover:underline">
      {{ question.name }}さん
    </div>
  </div>
</template>

<script>
export default {
  props: ["question"],
};
</script>
