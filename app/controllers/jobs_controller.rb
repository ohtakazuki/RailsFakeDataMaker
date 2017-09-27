class JobsController < ApplicationController
  before_action :logged_in_user

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
    # 3.times {|i| @job.columns.push(Column.new(name:"name#{i}")) }
    3.times {|i| @job.columns.build(name:"name#{i}") }
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

  private

    def job_params
      #params.require(:job).permit(:name, :format, :char_code, columns_attributes:[:name, :data_type])
      #params.require(:job).permit(:name, :format, :char_code, :columns)
      #params.require(:job).permit(:name, :format, :char_code, :columns => [])
      #params.require(:job).permit(:name, :format, :char_code, {:columns => []})
      #params.require(:job).permit(:name, :format, :char_code, columns_attributes: [:id, :name, :data_type])
      params.require(:job).permit(:name, :format, :char_code, columns_attributes: [:id, :name, :data_type, :job_id])
    end
end
