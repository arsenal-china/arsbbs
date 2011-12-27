$(document).ready(function () {
  $("#ie6_message").show().dialog({
    modal: true,
    width: "400",
    buttons: {
      "知道了": function () {
        $(this).dialog("close").remove();
      },
      "立刻升级": function () {
        window.open("http://windows.microsoft.com/zh-CN/internet-explorer/downloads/ie?ocid=ie6_countdown_bannercode", "_blank");
      },
      "为什么？": function () {
        window.open("http://www.theie6countdown.cn/", "_blank");
      }
    }
  });
});