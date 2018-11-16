def get_first_name_of_season_winner(data, season)
  new_array = []
  data.each do | season_number, all_contestants |
    if season_number == season
      all_contestants.each do | contestant_data |
        if contestant_data["status"] == "Winner"
          new_array << contestant_data.values_at("name")
        end
      end
    end
  end
  string = new_array[0].to_s.split(' ')
  string = string[0] #gets the first name
  string = string[2..-1]
end

def get_contestant_name(data, occupation)
  new_array = []
  data.each do | season_number, all_contestants |
    all_contestants.each do | contestant_data |
      if contestant_data["occupation"] == occupation
        new_array << contestant_data["name"]
      end
    end
  end
  new_array[0].to_s
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do | season_number, all_contestants |
    all_contestants.each do | contestant_data |
      if contestant_data["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  new_array = []
  data.each do | season_number, all_contestants |
    all_contestants.each do | contestant_data |
      if contestant_data["hometown"] == hometown
        new_array << contestant_data["occupation"]
        return new_array[0].to_s
      end
    end
  end
end

def get_average_age_for_season(data, season)
  new_array = []
  total_age = 0
  counter = 0
  data.each do | season_number, all_contestants |
    if season_number == season
      all_contestants.each do | contestant_data |
        new_array << contestant_data["age"]
        new_array.each do |age|
          total_age = (total_age + age.to_f)
          counter = counter += 1
        end
      end
    end
  end
  average_age = (total_age / counter).to_f.ceil
end
