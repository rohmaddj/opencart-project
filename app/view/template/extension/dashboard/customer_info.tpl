      <div class="xe-widget xe-counter-block xe-counter-block-blue"  data-count=".num" data-from="0" data-to="<?php echo $total; ?>" data-suffix="" data-duration="2">
        <div class="xe-upper">
                
          <div class="xe-icon">
            <i class="linecons-user"></i>
          </div>
      
          <div class="xe-label">
            <strong class="num">0</strong>
          <span><?php echo $heading_title; ?></span>
          </div>
                
        </div>
        <div class="xe-lower">
        <div class="border"></div>

        <?php echo $percentage; ?>%
        <?php if ($percentage > 0) { ?>
        <i class="fa fa-caret-up"></i>
        <?php } elseif ($percentage < 0) { ?>
        <i class="fa fa-caret-down"></i>
        <?php } ?>
        <a href="<?php echo $customer; ?>"><span><?php echo $text_view; ?></span></a>
        </div>
      </div>