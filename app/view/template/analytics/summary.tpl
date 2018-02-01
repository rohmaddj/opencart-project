<?php echo $header; ?><?php echo $column_left; ?>
  <div class="page-header">
      <h1><?php echo $heading_title; ?></h1>
      <ol class="breadcrumb bc-3">
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        </ol>
    </div>
    <div class="row">
      
        <div class="col-md-8">
          
          <ul class="nav nav-tabs nav-tabs-justified">
            <li class="active">
              <a href="#home-3" data-toggle="tab">
                <span class="visible-xs"><i class="fa-home"></i></span>
                <span class="hidden-xs">Sales</span>
              </a>
            </li>
            <li>
              <a href="#profile-3" data-toggle="tab">
                <span class="visible-xs"><i class="fa-user"></i></span>
                <span class="hidden-xs">Outlet</span>
              </a>
            </li>
            <li>
              <a href="#messages-3" data-toggle="tab">
                <span class="visible-xs"><i class="fa-envelope-o"></i></span>
                <span class="hidden-xs">Product</span>
              </a>
            </li>
            <li>
              <a href="#settings-3" data-toggle="tab">
                <span class="visible-xs"><i class="fa-cog"></i></span>
                <span class="hidden-xs">Customer</span>
              </a>
            </li>
            <li>
              <a href="#inbox-3" data-toggle="tab">
                <span class="visible-xs"><i class="fa-bell-o"></i></span>
                <span class="hidden-xs">Discounts</span>
              </a>
            </li>
          </ul>
      </div>
    </div>
          
    <div class="tab-content">
      <div class="tab-pane active" id="home-3">

      <div class="panel panel-default">
        <div class="panel-body">

        <div class="form-group"> <label class="col-sm-3 control-label"><h3 style="color: black">Sales Analytics</h3></label> <div class="col-sm-6"> <div class="input-group"><input type="text" class="form-control"> <span class="input-group-addon"><i class="fa-binoculars"></i></span> </div> </div> <div class="col-sm-2"><button class="btn btn-blue" style="border-radius: 7px">Filter</button></div></div>
        <div class="col-md-12" style="opacity: 0.1;padding: 10px">.</div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #e6f5da ;color:black"><center>
            <h3>Total Sales</br>$250,000(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Daily</br>$10,000(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center>
          </div>
        </div>
          <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas10" style="width: 11px;height: 3px"></canvas></div>
            <script type="text/javascript">
              var barChartData1 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div><div class="col-md-12"></div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #f1ea9d;color: black "><center>
            <h3>Average Bill</br>$250(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Per Pack</br>$50(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center></div>
          </div>
        <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas11" style="width: 11px;height: 3px"></canvas></div>
          <script type="text/javascript">
              var barChartData2 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div>
        <div class="col-md-12"></div>
        <div class="form-group">
        <div class="col-md-4"><div id="container""><canvas id="canvas12" height="300px"></canvas></div>
          <script type="text/javascript">
              var doughnutChartData = {
                datasets: [{
                  backgroundColor: ['#64ce0f','#335aea','#33eaea', '#dfea33'],
                  data: [10,20,40,50]
              }]
              };
        </script>
        </div>
        <div class="col-md-8"><canvas id="canvas15"></canvas>
          <script type="text/javascript">
            var data = {
              labels: [" ", " ", " ", " ", " ", " "],
              datasets: [{
                backgroundColor: 'rgb(227, 236, 249)',
                data: [4,3,2,1,2,1]
              }, {
                backgroundColor: 'rgb(178, 209, 255)',
                data: [5,4,1,2,1,1]
              }, {
                backgroundColor: 'rgb(163, 200, 255)',
                data: [8,7,2,2,1,2]
              }]
            };

            var options = {
              segmentShowStroke: false,
              elements: {
                line: {
                  tension: 0.000001
                },
                point: {
                  radius: 0
                }
              },
              legend: {
                display: false
              },
              responsive: true,
              tooltips: {
                mode: 'index',
              },
              hover: {
                mode: 'index'
              },
              scales: {
                yAxes: [{
                  stacked: true,
                  ticks: {
                    display: false,
                    stepSize:3
                },

                }]
              }
            };
          </script>
        </div>
        </div><div class="col-md-12" style="padding-top: 10px"></div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #f1ea9d;color: black "><center>
            <h3>Key Product Sales</br>$250,000(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Daily</br>$10,000(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center></div>
          </div>
        <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas13" style="width: 11px;height: 3px"></canvas></div>
          <script type="text/javascript">
              var barChartData3 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div>
        <div class="col-sm-2" style="float: right;">
          <button class="btn btn-white btn-icon btn-icon-standalone">
            <i class="fa-download"></i>
              <span>Download</span>
          </button>
        </div>
        <div class="col-md-12">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td>Date</td>
                  <td>Sales</td>
                  <td>In-store</td>
                  <td>Delivery</td>
                  <td>Pickup</td>
                  <td>Dine-in</td>
                  <td>Key Product</td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>10/1/2018</td>
                  <td>$50,000</td>
                  <td>3</td>
                  <td>$10,00</td>
                  <td>5</td>
                  <td>7</td>
                  <td>$10,00</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>2</td>
                  <td>$50,000</td>
                  <td>$10,00</td>
                  <td>5</td>
                  <td>$10,00</td>
                  <td>8</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$10,00</td>
                  <td>3</td>
                  <td>4</td>
                  <td>$50,000</td>
                  <td>7</td>
                  <td>$10,00</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$50,000</td>
                  <td>3</td>
                  <td>$10,00</td>
                  <td>5</td>
                  <td>7</td>
                  <td>$10,00</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$50,000</td>
                  <td>3</td>
                  <td>4</td>
                  <td>$10,00</td>
                  <td>$10,00</td>
                  <td>8</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$10,00</td>
                  <td>3</td>
                  <td>$50,000</td>
                  <td>5</td>
                  <td>$10,00</td>
                  <td>8</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      </div>
      </div>
      <div class="tab-pane" id="profile-3">
        
        <div class="panel panel-default">
        <div class="panel-body">

        <div class="form-group"> <label class="col-sm-3 control-label"><h3 style="color: black">Outlet Analytics</h3></label> <div class="col-sm-6"> <div class="input-group"><input type="text" class="form-control"> <span class="input-group-addon"><i class="fa-binoculars"></i></span> </div> </div> <div class="col-sm-2"><button class="btn btn-blue" style="border-radius: 7px">Filter</button></div></div>
        <div class="col-md-12" style="opacity: 0.1;padding: 10px">.</div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #e6f5da ;color:black"><center>
            <h3>Total Sales</br>$250,000(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Daily</br>$10,000(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center>
          </div>
        </div>
          <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas16" style="width: 11px;height: 3px"></canvas></div>
            <script type="text/javascript">
              var barChartData16 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div><div class="col-md-12"></div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #f1ea9d;color: black "><center>
            <h3>Total Patrons</br>$250(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Daily</br>$50(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center></div>
          </div>
        <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas17" style="width: 11px;height: 3px"></canvas></div>
          <script type="text/javascript">
              var barChartData17 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div>

        <div class="col-md-12" style="padding: 5px"></div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #e6f5da ;color:black"><center>
            <h3>Average Bill</br>$250,000(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Per Pack</br>$10,000(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center>
          </div>
        </div>
          <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas18" style="width: 11px;height: 3px"></canvas></div>
            <script type="text/javascript">
              var barChartData18 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div>
        <div class="col-md-12"></div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #f1ea9d;color: black "><center>
            <h3>Table Turn</br>$250(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>(Full Day)</h4></center></div>
          </div>
        <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas19" style="width: 11px;height: 3px"></canvas></div>
          <script type="text/javascript">
              var barChartData19 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div>
        <div class="col-md-12" style="padding: 5px"></div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #e6f5da ;color:black"><center>
            <h3>Total Discount</br>$250,000(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Daily</br>$10,000(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center>
          </div>
        </div>
          <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas20" style="width: 11px;height: 3px"></canvas></div>
            <script type="text/javascript">
              var barChartData20 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div>

        <div class="col-md-12" style="padding-top: 10px"></div>
        <div class="form-group">
          <div class="col-md-4"><div class="panel panel-default panel-border" style="background-color: #f1ea9d;color: black "><center>
            <h3>Key Product Sales</br>$250,000(<i class="fa-arrow-up" style="color: blue"></i>5%)</h3><h4>Average Daily</br>$10,000(<i class="fa-arrow-down" style="color: red"></i>1%)</h4></center></div>
          </div>
        <div class="col-md-8"><div id="container" style="width: 100%;"><canvas id="canvas21" style="width: 11px;height: 3px"></canvas></div>
          <script type="text/javascript">
              var barChartData21 = {
                labels: [" "," "," "," "," "," "," "," "," "," "," "],
                datasets: [{
                  backgroundColor: '#f5dc2b',
                  data: [1,1.1,1.2,1.3,1.4,1.5,1,0.8,0.5,1.1,0.4,1.1]
                }]
              };

            </script>
          </div>
        </div>
        <div class="col-sm-2" style="float: right;">
          <button class="btn btn-white btn-icon btn-icon-standalone">
            <i class="fa-download"></i>
              <span>Download</span>
          </button>
        </div>
        <div class="col-md-12">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td>Date</td>
                  <td>Sales</td>
                  <td>In-store</td>
                  <td>Delivery</td>
                  <td>Pickup</td>
                  <td>Dine-in</td>
                  <td>Key Product</td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>10/1/2018</td>
                  <td>$50,000</td>
                  <td>3</td>
                  <td>$10,00</td>
                  <td>5</td>
                  <td>7</td>
                  <td>$10,00</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>2</td>
                  <td>$50,000</td>
                  <td>$10,00</td>
                  <td>5</td>
                  <td>$10,00</td>
                  <td>8</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$10,00</td>
                  <td>3</td>
                  <td>4</td>
                  <td>$50,000</td>
                  <td>7</td>
                  <td>$10,00</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$50,000</td>
                  <td>3</td>
                  <td>$10,00</td>
                  <td>5</td>
                  <td>7</td>
                  <td>$10,00</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$50,000</td>
                  <td>3</td>
                  <td>4</td>
                  <td>$10,00</td>
                  <td>$10,00</td>
                  <td>8</td>
                </tr>
                <tr>
                  <td>10/1/2018</td>
                  <td>$10,00</td>
                  <td>3</td>
                  <td>$50,000</td>
                  <td>5</td>
                  <td>$10,00</td>
                  <td>8</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="col-sm-6">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td>Patrons</td>
                  <td>Count</td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="col-sm-6">
          <button class="btn btn-primary btn-lg" style="border-radius: 8px">W D</button>
          <div id="container"">
            <canvas id="canvas22" height="160px"></canvas>
          </div>
          <script type="text/javascript">
              var doughnutChartDataOutlet = {
                datasets: [{
                  backgroundColor: ['#64ce0f','#335aea','#33eaea', '#dfea33'],
                  data: [10,20,40,50]
              }]
              };
        </script>
        </div>
        <div class="col-md-12"></div>
        <div class="col-sm-6">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td>Patrons</td>
                  <td>Count</td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
                <tr>
                  <td>1 Pax</td>
                  <td>200 (30%)</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="col-sm-6">
          <button class="btn btn-danger btn-lg" style="border-radius: 8px">W E</button>
          <div id="container"">
            <canvas id="canvas23" height="160px"></canvas>
          </div>
          <script type="text/javascript">
              var doughnutChartDataOutlet1 = {
                datasets: [{
                  backgroundColor: ['#64ce0f','#335aea','#33eaea', '#dfea33'],
                  data: [10,20,40,50]
              }]
              };
        </script>
        </div>
      </div>
      </div>
      </div>
      <div class="tab-pane" id="messages-3">
        
        <p>When be draw drew ye. Defective in do recommend suffering. House it seven in spoil tiled court. Sister others marked fat missed did out use. Alteration possession dispatched collecting instrument travelling he or on. Snug give made at spot or late that mr. </p>
        
        <p>Carriage quitting securing be appetite it declared. High eyes kept so busy feel call in. Would day nor ask walls known. But preserved advantage are but and certainty earnestly enjoyment. Passage weather as up am exposed. And natural related man subject. Eagerness get situation his was delighted. </p>
    
      </div>
      
      <div class="tab-pane" id="settings-3">
          
        <p>Luckily friends do ashamed to do suppose. Tried meant mr smile so. Exquisite behaviour as to middleton perfectly. Chicken no wishing waiting am. Say concerns dwelling graceful six humoured. Whether mr up savings talking an. Active mutual nor father mother exeter change six did all. </p>
        
        <p>Carriage quitting securing be appetite it declared. High eyes kept so busy feel call in. Would day nor ask walls known. But preserved advantage are but and certainty earnestly enjoyment. Passage weather as up am exposed. And natural related man subject. Eagerness get situation his was delighted. </p>
  
      </div>
      
      <div class="tab-pane" id="inbox-3">
          
        <p>Carriage quitting securing be appetite it declared. High eyes kept so busy feel call in. Would day nor ask walls known. But preserved advantage are but and certainty earnestly enjoyment. Passage weather as up am exposed. And natural related man subject. Eagerness get situation his was delighted. </p>
        
        <p>Luckily friends do ashamed to do suppose. Tried meant mr smile so. Exquisite behaviour as to middleton perfectly. Chicken no wishing waiting am. Say concerns dwelling graceful six humoured. Whether mr up savings talking an. Active mutual nor father mother exeter change six did all. </p>
  
      </div>
    </div>
    <script type="text/javascript">
      window.onload = function() {
        var ctx10 = document.getElementById("canvas10").getContext("2d");
        window.myBar1 = new Chart(ctx10, {
          type: 'bar',
          data: barChartData1,
          options: {
            legend: {
              display: false
            },
            responsive: true,
            scales: {
              xAxes: [{
                gridLines: {
                  display:false,
                  drawBorder: false
                }
              }],
              yAxes: [{
                gridLines: {
                  display:false,
                  drawBorder: false
                },
                ticks: {
                  display: false,
                  stepSize:1
                }   
              }]
            }
          },
        });
      var ctx11= document.getElementById("canvas11").getContext("2d");
      window.myBar2 = new Chart(ctx11, {
        type: 'bar',
        data: barChartData2,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx12 = document.getElementById("canvas12").getContext("2d");
      window.mybar3 = new Chart(ctx12, {
        type: 'doughnut',
        data: doughnutChartData,

      });

      var ctx13= document.getElementById("canvas13").getContext("2d");
      window.myBar3 = new Chart(ctx13, {
        type: 'bar',
        data: barChartData3,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx15 = document.getElementById("canvas15").getContext("2d");
      window.mybar5 = new Chart(ctx15, {
        type: 'line',
        data: data,
        options: options
      });

      var ctx13= document.getElementById("canvas16").getContext("2d");
      window.myBar16 = new Chart(ctx13, {
        type: 'bar',
        data: barChartData16,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx17= document.getElementById("canvas17").getContext("2d");
      window.myBar17 = new Chart(ctx17, {
        type: 'bar',
        data: barChartData17,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx18= document.getElementById("canvas18").getContext("2d");
      window.myBar18 = new Chart(ctx18, {
        type: 'bar',
        data: barChartData18,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx19= document.getElementById("canvas19").getContext("2d");
      window.myBar19 = new Chart(ctx19, {
        type: 'bar',
        data: barChartData19,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx20= document.getElementById("canvas20").getContext("2d");
      window.myBar20 = new Chart(ctx20, {
        type: 'bar',
        data: barChartData20,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx21= document.getElementById("canvas21").getContext("2d");
      window.myBar21 = new Chart(ctx21, {
        type: 'bar',
        data: barChartData21,
        options: {
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              }
            }],
            yAxes: [{
              gridLines: {
                display:false,
                drawBorder: false
              },
              ticks: {
                display: false,
                stepSize:1
              }   
            }]
          }
        },
      });

      var ctx22 = document.getElementById("canvas22").getContext("2d");
      window.mybar22 = new Chart(ctx22, {
        type: 'doughnut',
        data: doughnutChartDataOutlet,

      });

      var ctx23 = document.getElementById("canvas23").getContext("2d");
      window.mybar23 = new Chart(ctx23, {
        type: 'doughnut',
        data: doughnutChartDataOutlet1,

      });

    };
    </script>
    
<?php echo $footer;?>
