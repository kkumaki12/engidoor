/* import { createLocalVue, shallowMount } from '@vue/test-utils'
import QuestionBase from '@/components/questions/QuestionBase.vue'
import Vuex from 'vuex'

const localVue = createLocalVue()

localVue.use(Vuex)

describe('質問内容が70文字以上の場合、内容がカットされること', () => {
  it('質問が表示されないこと', () => {
    const wrapper = shallowMount(QuestionBase,{
      propsData:{
        questions: [1,2,3,4,5,6]
      }
    })
    const sampleSpy = jest.spyOn( contentSlice , "contentSlice").mockReturnValueOnce("1");

    expect(SampleSpy).toHaveBeenCalled();
  })
})



describe('QuestionBase.vue', () => {
  it('質問が表示されないこと', () => {
    const wrapper = shallowMount(QuestionBase,{
      propsData:{
        questions: [1,2,3,4,5,6]
      }
    });
    const questions = wrapper.find('#questions'); 

    expect(questions.exists()).toBe(false)
  })
})
 */
