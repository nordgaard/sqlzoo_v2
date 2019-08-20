class ProblemsController < ApplicationController

def index
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1 
    @visit_count = session[:count]
    @problems = Problem.all
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.create(
      chapterName: params[:chapterName],
      problemNumber: params[:problemNumber],
      question: params[:question],
      answer: params[:answer]
      )

    if @problem.save
      flash[:success] = "Problem Created"
      redirect_to "/problems/#{@problem.id}"
    else
      render :new
    end
    # @problem.images.create(url: params[:image], problem_id: @problem.id)

  end

  def show
    @problem = Problem.find_by(id: params[:id])
    #returns single instance supplier hash
  end

  def edit
    @problem = Problem.find_by(id: params[:id])
  end

  def update
    @problem = Problem.find_by(id: params[:id])
    @problem.update(
      chapterName: params[:chapterName],
      problemNumber: params[:problemNumber],
      question: params[:question],
      answer: params[:answer]
      )

    if @problem.save
      flash[:success] = "Problem Updated"
      redirect_to "/problems/#{@problem.id}"
    else
      render :edit
    end

  end

  def destroy
    @problem = Problem.find_by(id: params[:id])
    @problem.destroy

    flash[:warning] = "Problem Destroyed"
    redirect_to "/problems"
  end

  def search
    
  end
end
