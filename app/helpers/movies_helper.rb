module MoviesHelper
  def format_total_gross(movie)
    if movie.flop?
      content_tag(:strong,'Flop!')
    else
      number_to_currency(movie.total_gross)
    end
  end
  
  def image_for(movie)
    if movie.image_file_name.blank?
      image_tag 'placeholder.png'
    else
      image_tag movie.image_file_name
    end
  end
  
  def format_average_stars(movie)
    avg = movie.average_stars
    if avg.nil?
      content_tag(:strong, "No reviews")
    else
      pluralize(number_with_precision(avg, precision: 1), "star")
      #"*" * avg.round
    end
  end
end
