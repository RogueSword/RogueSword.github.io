<div style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center;">
  <div style="color:rgb(171, 172, 167)">{{ theme.reward_comment }}</div>
  <button id="rewardButton" disable="enable" onclick="var qr = document.getElementById('QR'); if (qr.style.display === 'none') {qr.style.display='block';} else {qr.style.display='none'}">
    <span>{{ __('reward.donate') }}</span>
  </button>
  <div id="QR" style="display: none;">    
    <iframe src="https://www.yuelei.top/hexo-donate/simple/index.html" style="overflow-x:hidden;overflow-y:hidden; border:0xp none #fff; min-height:240px; width:100%;"  frameborder="0" scrolling="no"></iframe>
  </div>
</div>
