{% if page.copyright %}
<div class="my_post_copyright">
  <script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>

  <!-- JS库 sweetalert 可修改路径 -->
  <script type="text/javascript" src="http://jslibs.wuxubj.cn/sweetalert_mini/jquery-1.7.1.min.js"></script>
  <script src="http://jslibs.wuxubj.cn/sweetalert_mini/sweetalert.min.js"></script>
  <link rel="stylesheet" type="text/css" href="http://jslibs.wuxubj.cn/sweetalert_mini/sweetalert.mini.css">
  <p><span>文章作者:</span><a href="/" title="访问 {{ theme.author }} 的个人博客">{{ theme.author }}</a></p>
  <p><span>最后更新:</span>{{ page.updated.format("YYYY年MM月DD日 HH:MM:ss") }}</p>
  <p><span>原始链接:</span><a href="{{ url_for(page.path) }}" title="{{ page.title }}">{{ page.permalink }}</a></p>
  <p><span>版权声明:</span>本博客所有文章除特别声明外，均采用 <i class="fa fa-creative-commons"></i> <a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/3.0/" target="_blank" title="Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)"> BY-NC-SA 3.0 许可协议</a>，转载请注明出处！</p>  
</div>
{% endif %}