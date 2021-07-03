import axios from "axios";

export default axios.create({
  // ヘッダーにX-Requested-Withを追加する
  headers: {
    "X-Requested-With": "XMLHttpRequest",
  },
  // リクエストに、sessionとcookieを含めるようにする
  withCredentials: true,
});
