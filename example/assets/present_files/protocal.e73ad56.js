!(function () {
  document.addEventListener('DOMContentLoaded', function () {
    var app = document.getElementById("app");
    var nScrollHeight = app.scrollHeight; // 内容的总高度
    var nAppHeight = parseFloat(getComputedStyle(app).height); // #app的高度
    app.addEventListener('scroll', function () {
      var nScrollTop = app.scrollTop; // 实际滚动偏移高度
      if (nScrollHeight <= nScrollTop + nAppHeight + 15) {
         window.flutter_inappbrowser.callHandler('scroll').then(function(result) {

                    });
      }
    });
  });
})();
