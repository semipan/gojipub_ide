<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ pagetitle }}</title>
  <link href="/static/plugins/ide/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
  <link href="/static/plugins/ide/css/jquery-ui.css" rel="stylesheet" type="text/css">
  <script src="/static/plugins/ide/js/jquery-1.12.4.min.js"></script>
  <script src="/static/plugins/ide/js/jquery-ui.min.js"></script>
  <script src="/static/plugins/ide/js/jquery.mousewheel.min.js"></script>
  <script type="text/javascript" src="/static/plugins/ide/js/jquery.ui.scrolltabs.js"></script>
  <link rel="stylesheet" href="/static/plugins/ide/css/split-pane.css" />
  <link rel="stylesheet" href="/static/plugins/ide/css/pretty-split-pane.css" />
  <link rel="stylesheet" href="/static/plugins/ide/codemirror/codemirror.css">
  <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <style type="text/css">
    html,
    body {
      height: 100%;
      min-height: 100%;
      margin: 0;
      padding: 0;
    }

    #left-component {
      width: 20em;
      /* Same as divider left */
    }

    #my-divider {
      left: 20em;
      width: 5px;
    }

    #right-component {
      left: 20em;
      /* Same as divider left */
    }

    .ui-scroll-tabs-header:after {
      content: "";
      display: table;
      clear: both;
    }

    .ui-scroll-tabs-view {
      z-index: 1;
      overflow: hidden;
    }

    .ui-scroll-tabs-view .ui-widget-header {
      border: none;
      background: transparent;
    }

    .ui-scroll-tabs-header {
      position: relative;
      overflow: hidden;
    }

    .ui-scroll-tabs-header .stNavMain {
      position: absolute;
      top: 0;
      z-index: 2;
      height: 100%;
      opacity: 0;
      transition: left .5s, right .5s, opacity .8s;
      transition-timing-function: swing;
    }

    .ui-scroll-tabs-header .stNavMain button {
      height: 100%;
    }

    .ui-scroll-tabs-header .stNavMainLeft {
      left: -250px;
    }

    .ui-scroll-tabs-header .stNavMainLeft.stNavVisible {
      left: 0;
      opacity: 1;
    }

    .ui-scroll-tabs-header .stNavMainRight {
      right: -250px;
    }

    .ui-scroll-tabs-header .stNavMainRight.stNavVisible {
      right: 0;
      opacity: 1;
    }

    .ui-scroll-tabs-header ul.ui-tabs-nav {
      position: relative;
      white-space: nowrap;
    }

    .ui-scroll-tabs-header ul.ui-tabs-nav li {
      display: inline-block;
      float: none;
    }

    .ui-scroll-tabs-header ul.ui-tabs-nav li.stHasCloseBtn a {
      padding-right: 0.5em;
    }

    .ui-scroll-tabs-header ul.ui-tabs-nav li span.stCloseBtn {
      float: left;
      padding: 4px 2px;
      border: none;
      cursor: pointer;
    }

    .ui-tabs .ui-tabs-panel {
      padding: 0px;
    }

    .CodeMirror {
      border-bottom: 1px solid #eee;
      height: 95%;
    }

    .CodeMirror-scroll {
      height: 100%;
      overflow-y: hidden;
      overflow-x: auto;
    }

    #root a {
      text-decoration: none;
      color: black;
    }

    #root a:hover {
      border-bottom: 1px dashed #1d8cbd;
      ;
      color: blue;
    }

    .ui-widget-content {
      height: 99%;
      overflow-y: hidden;
    }
  </style>
</head>

<body>
  <div class="pretty-split-pane-frame">
    <div class="split-pane fixed-left">
      <div class="split-pane-component" id="left-component">
        <div class="pretty-split-pane-component-inner" style="padding:0px;">
          <div id="root" style="padding-left: 15px; padding-top: 15px;"></div>
        </div>
      </div>
      <div class="split-pane-divider" id="my-divider"></div>
      <div class="split-pane-component" id="right-component">
        <div class="pretty-split-pane-component-inner" style="padding: 0px;font-size:12px;">
          <div id="example_0">
            <ul role="tablist">
              <li role="tab"><a href="#tabs-0-1" role="presentation">/template/index/index.volt</a></li>
            </ul>
            <div class="content" id="tabs-0-1" role="tabpanel" style=" height: 100%;"><textarea class="code" name="code"
                id="index" data-id="d553082a3e451063f71e307981990dd8">{{ content }}</textarea>
              <div
                style="position:absolute;z-index:9999;right:40px;top:60px;width:60px;border:1px solid #aaa;padding:5px; background:#ccc;">
                <a href="javascript:;" data-id="d553082a3e451063f71e307981990dd8" data-path="/template/index/index.volt"
                  class="save">保存更改</a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="/static/plugins/ide/js/split-pane.js"></script>
  <script src="/static/plugins/ide/codemirror/codemirror.js"></script>
  <script src="/static/plugins/ide/codemirror/addon/selection/selection-pointer.js"></script>
  <script src="/static/plugins/ide/codemirror/mode/xml/xml.js"></script>
  <script src="/static/plugins/ide/codemirror/mode/javascript/javascript.js"></script>
  <script src="/static/plugins/ide/codemirror/mode/css/css.js"></script>
  <script src="/static/plugins/ide/codemirror/mode/vbscript/vbscript.js"></script>
  <script src="/static/plugins/ide/codemirror/mode/htmlmixed/htmlmixed.js"></script>
  <script>
    /**
     * 默认打开
     */
    var editor = [];
    editor[$("#index").attr('data-id')] = CodeMirror.fromTextArea(document.getElementById("index"), {
      mode: "htmlmixed",
      lineNumbers: true,
      lineWrapping: true,
    });
    //默认读取根目录的文件
    $(function () {
      $.ajax({
        type: "get",
        dataType: "json",
        url: "/console/plugins-app/ide?action=dir",
        success: function (result) {
          if (result.code == 0) {
            var html = '';
            for (var key in result.data) {
              alias = '';
              if (result.data[key]['alias'].length > 0) {
                alias = ' (' + result.data[key]['alias'] + ')';
              }
              if (result.data[key]['type'] == 'FOLDER') {
                html += '<div><i class="fa fa-folder" aria-hidden="true"></i> <a href="javascript:;" class="folder" data-folder="' + result.data[key]['path'] + '">' + result.data[key]['name'] + alias + '</a><div></div></div>';
              } else {
                html += '<div><i class="fa fa-file-o" aria-hidden="true"></i> <a data-id="' + result.data[key]['md5'] + '" class="addRandomTab" data-name="' + result.data[key]['name'] + '" href="javascript:;">' + result.data[key]['name'] + alias + '</a></div>';
              }
            }
            $("#root").html(html);
          } else {
            alert(result.msg);
          }
        },
        error: function () {
          alert("异常！");
        }
      });

      /**
       * 目录展开关闭
       */
      $('body').on('click', '.folder', function (event) {
        if ($(this).parent().children("i").hasClass("fa-folder-open")) {
          $(this).parent().children("div").hide();
          $(this).parent().children("i").removeClass('fa-folder-open');
          $(this).parent().children("i").addClass('fa-folder');
        } else {
          $(this).parent().children("i").removeClass('fa-folder');
          $(this).parent().children("i").addClass('fa-folder-open');
          $(this).parent().children("div").show();
          $.ajax({
            type: "get",
            dataType: "json",
            url: "/console/plugins-app/ide?action=dir&path=" + $(this).attr("data-folder"),
            success: function (result) {
              if (result.code == 0) {
                var html = '';
                var tabb = '';
                str = $(this).attr("data-folder");
                for (i = 1; i < str.split('/').length; i++) {
                  tabb += "&nbsp;&nbsp;&nbsp;&nbsp;";
                }
                for (var key in result.data) {
                  alias = '';
                  if (result.data[key]['alias'].length > 0) {
                    alias = ' (' + result.data[key]['alias'] + ')';
                  }
                  if (result.data[key]['type'] == 'FOLDER') {
                    html += '<div>' + tabb + '<i class="fa fa-folder" aria-hidden="true"></i> <a href="javascript:;" class="folder" data-folder="' + $(this).attr("data-folder") + '/' + result.data[key]['name'] + '">' + result.data[key]['name'] + alias + '</a><div></div></div>';
                  } else {
                    if (result.data[key]['ext'] == 'volt' || result.data[key]['ext'] == 'js' || result.data[key]['ext'] == 'css') {
                      html += '<div>' + tabb + '<i class="fa fa-file-o" aria-hidden="true"></i> <a data-id="' + result.data[key]['md5'] + '" class="addRandomTab" data-name="' + result.data[key]['path'] + '" href="javascript:;">' + result.data[key]['name'] + alias + '</a></div>';
                    } else {
                      html += '<div>' + tabb + '<i class="fa fa-file-o" aria-hidden="true"></i> <a href="' + host + '/theme/default/' + result.data[key]['path'] + '" target="_blank">' + result.data[key]['name'] + alias + '</a></div>';
                    }
                  }
                }
                $(this).parent().children("div").html(html);
              } else {
                alert(result.msg);
              }
            }.bind(this),
            error: function () {
              alert("异常！");
            }
          });
        }
        return false;
      })
      $('#example_0').scrollTabs({
        scrollOptions: {
          enableDebug: true,
          selectTabAfterScroll: true
        }
      });

      $('body').on('click', '.addRandomTab', function (e) {
        var label = $(this).attr('data-name');
        var id = 'code-' + $(this).attr('data-id');
        if ($("#" + id).length > 0) {
          alert("文件已经打开");
          return false;
        }
        $('#example_0').data('uiScrollTabs').addTab(label, '<div style="position:absolute;z-index:9999;right:40px;top:60px;width:60px;border:1px solid #aaa;padding:5px; background:#ccc;"><a href="javascript:;" data-id="' + $(this).attr('data-id') + '" class="save" data-path="' + $(this).attr('data-name') + '">保存更改</a></div><textarea class="code" id="' + id + '" name="code"></textarea>');
        editor[$(this).attr('data-id')] = CodeMirror.fromTextArea(document.getElementById(id), {
          mode: "htmlmixed",
          lineNumbers: true,
          lineWrapping: true,
        });
        $.ajax({
          type: "get",
          dataType: "json",
          url: "/console/plugins-app/ide?action=file&path=" + $(this).attr('data-name'),
          success: function (result) {
            if (result.code == 0) {
              editor[$(this).attr('data-id')].setValue(result.data);
            } else {
              alert(result.msg);
            }
          }.bind(this),
          error: function () {
            alert("异常！");
          }
        });
        //$(this).removeClass("addRandomTab");
      });
      //保存
      $('body').on('click', '.save', function (e) {
        var obj = $(this);
        $.ajax({
          type: "POST",
          dataType: "json",
          url: "/console/plugins-app/ide?action=save",
          data: { content: editor[$(this).attr('data-id')].getValue(), path: $(this).attr('data-path') },
          success: function (result) {
            if (result.code == 0) {
              obj.html('保存成功');
              setTimeout(function () {
                obj.html('保存更改');
              }, 2000)
            } else {
              alert(result.msg);
            }
          },
          error: function () {
            alert("异常！");
          }
        });
      });
    });
  </script>
</body>

</html>