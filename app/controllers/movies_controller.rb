class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params[:title] || params[:director] 
      @movies = @movies.where("title like :title AND director like :director", :title => "%#{params[:title]}%", :director => "%#{params[:director]}%")
    end
    case params[:duration]
      when '2' 
        @movies = @movies.where("runtime_in_minutes <= 90")
      when '3'
        @movies = @movies.where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120")
      when '4'
        @movies = @movies.where("runtime_in_minutes > 120")
      else
    end

    @movies = @movies.order(:title).page params[:page]
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description,:image, :remote_image_url
    )
  end

end
