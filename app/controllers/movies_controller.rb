class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params[:title] 
      @movies = @movies.title_like(params[:title])
    end
    if params[:director]
      @movies = @movies.director_like(params[:director])      
    end
    case params[:duration]
      when '2' 
        @movies = @movies.duration_less_than_90
      when '3'
        @movies = @movies.duration_between_90_and_120
      when '4'
        @movies = @movies.duration_longer_than_120
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
