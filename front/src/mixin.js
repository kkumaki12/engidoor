import moment from "moment";

export default {
  filters: {
    moment: function (date) {
      moment.locale("ja");
      return moment(date).fromNow();
    },
  },
}
