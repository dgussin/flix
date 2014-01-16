require "spec_helper"

describe "Viewing the list of movies" do
  
  it "shows the movies" do

    movie1 = Movie.create(title: "Iron Man",
                          rating: "PG-13",
                          total_gross: 318412101.00,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02",
                          cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
                          director: "Jon Favreau",
                          duration: "126 min",
                          image_file_name: "ironman.jpg")
  
    movie2 = Movie.create(movie_attributes(title: "Superman",
                          rating: "PG",
                          total_gross: 134218018.00,
                          description: "Clark Kent grows up to be the greatest super-hero",
                          released_on: "1978-12-15"))
    
  
    movie3 = Movie.create(movie_attributes(title: "Spider-Man",
                          rating: "PG-13",
                          total_gross: 403706375.00,
                          description: "Peter Parker gets bit by a genetically modified spider",
        released_on: "2002-05-03"))
      
    visit movies_url
      
    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)
      
    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..9])
    expect(page).to have_text("$318,412,101.00")
    expect(page).to have_text(movie1.duration)
    expect(page).to have_selector("img[src$='#{movie1.image_file_name}']")
  end
  
  it "does not show a Movie that hasn't yet been released" do
    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))
    
    visit movies_path
    
    expect(page).not_to have_text(movie.title)
  end
end