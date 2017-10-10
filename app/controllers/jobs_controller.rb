class JobsController < ApplicationController
  include JobsHelper

  before_action :logged_in_user
  def get_fakers
    return FAKERS
  end
  
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    # 3.times {|i| @job.columns.build(name:"name#{i}", order_number:@job.columns.length+1) }
    3.times {|i| @job.columns.build order_number: @job.columns.length + 1 }
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Jobを登録しました"
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
    # 3.times {|i| @job.columns.build(name:"name#{i}", order_number:@job.columns.length+1) }
    @job.columns.build order_number: @job.columns.length + 1
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      flash[:success] = "ジョブを更新しました"
      redirect_to jobs_path
    else
      render 'edit'
    end
  end  

  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "ジョブを削除しました"
    redirect_to jobs_path
  end

  def download
    @job = Job.find(params[:session][:id])
    @cnt = (params[:session][:cnt] || "0").to_i
    response.headers['Content-Type'] = 'text/csv'
    response.headers['Content-Disposition'] = 'attachment; filename=invoice.csv'    
    render layout: false
    # render :template => "download.csv.erb"
    # Faker::const_get("Beer").send("name")
    # cnt = params[:session][:cnt]
    # @job = Job.find(params[:session][:id])
    # if !@job || @job.columns.length==0
    #   render html: "error"
    # end
  end

  def subfakers
    models = get_subfakers(params[:data_type])
    #render :json => models
    # render layout: false
  end

  private

    def job_params
      params.require(:job).permit(:name, :format, :char_code, columns_attributes: [:id, :name, :data_type, :data_key, :job_id, :order_number])
    end
end
