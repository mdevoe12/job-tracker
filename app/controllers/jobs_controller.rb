class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to company_jobs_path(@job.company)
  end

  def sort
      if params[:location] != nil
        @jobs = Job.where(city: params[:location])
      elsif params[:sort] == "interest"
        @jobs = Job.order(:level_of_interest)
        render :interest
      else
        @jobs = Job.where(city: params[:sort])
      end
  end


  def dashboard
    @job_interest = Job.order(:level_of_interest).group(:level_of_interest).count
    @company_interest = Job.joins(:company).group(:company)
                                 .average(:level_of_interest)
                                 .transform_values{|v| v.to_i}
                                 .sort_by{|k, v| v}
                                 .reverse.shift(3).to_h
    @job_count = Job.order(:city).group(:city).count

  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
