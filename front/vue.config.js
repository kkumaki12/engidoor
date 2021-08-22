module.exports = {
  publicPath: process.env.NODE_ENV === 'production'
  ? '/back.engidoor.com/'
  : '/',
  devServer: {
    // 開発サーバーのポート設定
    port: 8080,
    // 特定のパス以下をrailsに転送する設定
    proxy: {
      "*": {
        target: "http://localhost:3000",
      },
    },
  },
};
