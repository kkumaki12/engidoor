module.exports = {
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
