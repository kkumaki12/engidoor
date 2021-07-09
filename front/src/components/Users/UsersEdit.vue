<template>
<div class="w-full max-w-xl container mt-24">
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">

        
        <label :image, '画像'>
        <%= f.file_field :image, class: 'rounded w-full py-2 px-3  mb-3' %>
        <label for="UserName">ユーザー名</label>
        <input v-model="UserInformation.name" class='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline' id='UserName'>

        <label for="UserOccupation">職業</label>
        <input v-model="UserInformation.occupation" class='shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline'>

        <%= f.label :specialty, "得意分野" %>
        <label for="UserSpecialty">職業</label>
        <select>
            <option v-for='location in locations'></option>
        </select>

        <%= f.select :specialty,[["材料・素材","材料・素材"],["金型","金型"],["機械加工","機械加工"],["半導体","半導体"],["電子","電子"],["設計","設計"],["FA・自動化","FA・自動化"],["ロボット","ロボット"],["品質管理","品質管理"],["環境","環境"],["生産技術","生産技術"],["化学","化学"],["化学工学","化学工学"]],{} ,{include_blank: "選択してください",  class: 'shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline'}  %>



        <%= f.submit "更新する", class: "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full block" %>
</template>

<script>
export default {
  locations: ['材料・素材','金型','機械加工','半導体','電子','設計','FA・自動化','ロボット','品質管理','環境','生産技術','化学','化学工学'],
  data(): 
    return {
        UserInformation{
            name:'',
            occupation:'',

            
        }
    };
  },
};
</script>
