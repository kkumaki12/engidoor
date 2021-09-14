import { createLocalVue, shallowMount } from '@vue/test-utils'
import TheHeading from '@/components/layouts/TheHeading.vue'
import Vuex from 'vuex'

const localVue = createLocalVue()

localVue.use(Vuex)



describe('Header', () => {
  let store
  let actions
  beforeEach(() => {
    store = new Vuex.Store({
      state: {},
    })
  })



  it('アプリ名が表示されること', () => {
    const wrapper = shallowMount(TheHeading, {
      localVue, store
    })

    expect(wrapper.text()).toMatch("ENGIDOOR")
  })
})
