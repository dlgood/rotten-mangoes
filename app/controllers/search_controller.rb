class SearchController < ApplicationController

  # def search_results
  #   @search_results = Movie.search_results(params[:title],params[:director])

  # end


  # def index
  #   @results = Movie.all

  #   if params[:title].present?
  #     @results = @results.where("title LIKE ?", "%#{params[:title]}%")
  #   end

  #   if params[:director].present?
  #     @results = @results.where("director LIKE ?", "%#{params[:director]}%")
  #   end  

  #   if params[:duration].present?
  #     case params[:duration].to_i
  #       when 1
  #         @results = @results.where('runtime_in_minutes < 90')
  #       when 2 
  #         @results = @results.where('runtime_in_minutes < 120 AND runtime_in_minutes >= 90')
  #       when 3
  #         @results = @results.where('runtime_in_minutes > 120')
  #     end
  #   end  
  # end

end