import sum from '../src/sum.js'

it('関数sumに1と2を渡すと3が返ってくる', () => {
  // 関数sumの結果を格納
  const result = sum(1, 2)
  // sumの結果は3だよね！
  expect(result).toBe(3)
})
