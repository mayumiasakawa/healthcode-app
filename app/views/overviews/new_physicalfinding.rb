<div  id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
        <div id="content">

          <%= render "shared/header" %>

            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="p-5 pt-3">

                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                  <h1 class="h3 mb-0 text-gray-800">登録</h1>
                </div>

                  <%= form_with model: @overview, url: overviews_path, class: 'user',name: 'form', local: true do |f| %> 
                    
                    <%= render 'shared/error_messages', model: f.object %>

                  <div class="card card-body border-left-success mb-3 py-3">
                    <div class="h5 m-3">
                      身長・体重・腹囲　・BMI
                    </div>
                    <div class="form-group ml-4">
                        <div class='input-date-wrap'>
                          <label class="col-sm-12 col-md-2">測定日</label>
                          <%= raw sprintf(
                                        f.date_select(
                                          :physicalfinding_measuring_date,
                                          use_month_numbers: true,
                                          prompt:'--',
                                          start_year: (Time.now.year),
                                          end_year: 2000,
                                          date_separator: '%s'),
                                        "<p> 年 </p>", "<p> 月 </p>",) + "<p> 日 </p>" %>
                        </div>                                
                        <div class="row">
                          <div class="col-md-6 mt-2">
                            <%= f.text_field :height, class:"input-default form-control form-control-user overview", id:"height", placeholder:"身長（半角）cm", maxlength:"3" %> 
                          </div>                             
                          <div class="col-md-6 mt-2">
                            <%= f.text_field :weight, class:"input-default form-control form-control-user overview", id:"weight", placeholder:"体重（半角）cm", maxlength:"3" %>  
                          </div>
                          <div class="col-md-6 mt-2">
                            <%= f.text_field :abdominal_circumference, class:"input-default form-control form-control-user overview", id:"abdominal_cicumference", placeholder:"腹囲（半角）cm", maxlength:"3" %>
                          </div>
                          <div class="col-md-6 mt-2" >
                            <%= f.text_field :bmi, class:"input-default form-control form-control-user overview", id:"bmi-form", placeholder:"BMI 自動で計算されます", maxlength:"3" %>
                          </div>
                        </div>
                    </div>
                  </div>

                      <%= f.submit "登録" ,class:"btn btn-facebook btn-block" %>
                  <% end %>
              </div>        
            </div>

<%= render "shared/fotter" %>
