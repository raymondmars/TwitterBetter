(function() {
  var twitter_better_sv;

  twitter_better_sv = '<div id="twitter_better_overwrite_css"><style type="text/css">' + '.tweet p, .ProfileTweet-text{ ' + 'word-wrap: break-word;' + 'font-size: 20px;' + 'line-height: 1.5em;' + 'font-family: "Source Han Sans","Source Han Sans CN","思源黑体","思源黑體",Helvetica, Tahoma, Arial, STXihei, "华文细黑", "Microsoft YaHei", "微软雅黑", SimSun, "宋体", Heiti, "黑体", sans-serif;' + 'letter-spacing: 1px' + '}</style></div>';

  chrome.runtime.onMessage.addListener(function(msg, sender, sendResponse) {
    if (msg.text === 'set_font') {
      if (msg.setting.bigger_font === true) {
        if ($('div#twitter_better_overwrite_css').length === 0) {
          return $('body').append($(twitter_better_sv));
        }
      } else {
        if ($('div#twitter_better_overwrite_css').length > 0) {
          return $('div#twitter_better_overwrite_css').remove();
        }
      }
    }
  });

}).call(this);
