require "pry"

def game_hash
   {:home => {
     :team_name => "Brooklyn Nets", 
     :colors => ["Black", "White"], 
     :players => [
      {:name => "Alan Anderson", 
       :number => 0, 
       :shoe => 16, 
       :points => 22, 
       :rebounds => 12, 
       :assists => 12, 
       :steals => 3, 
       :blocks => 1, 
       :slam_dunks => 1}, 
      {:name => "Reggie Evans", 
       :number => 30, 
       :shoe => 14, 
       :points => 12, 
       :rebounds => 12, 
       :assists => 12, 
       :steals => 12, 
       :blocks => 12, 
       :slam_dunks => 7}, 
      {:name => "Brook Lopez", 
       :number => 11, 
       :shoe => 17, 
       :points => 17, 
       :rebounds => 19, 
       :assists => 10, 
       :steals => 3, 
       :blocks => 1, 
       :slam_dunks => 15},
      {:name => "Mason Plumlee", 
       :number => 1, 
       :shoe => 19, 
       :points => 26, 
       :rebounds => 11, 
       :assists => 6, 
       :steals => 3, 
       :blocks => 8, 
       :slam_dunks => 5},
      {:name => "Jason Terry", 
       :number => 31, 
       :shoe => 15, 
       :points => 19, 
       :rebounds => 2, 
       :assists => 2, 
       :steals => 4, 
       :blocks => 11, 
       :slam_dunks => 1}]
    }, 
   :away => {
     :team_name => "Charlotte Hornets", 
     :colors => ["Turquoise", "Purple"], 
     :players => [
      {:name => "Jeff Adrien", 
       :number => 4, 
       :shoe => 18, 
       :points => 10, 
       :rebounds => 1, 
       :assists => 1, 
       :steals => 2, 
       :blocks => 7, 
       :slam_dunks => 2},
      {:name => "Bismack Biyombo", 
       :number => 0, 
       :shoe => 16, 
       :points => 12, 
       :rebounds => 4, 
       :assists => 7, 
       :steals => 22, 
       :blocks => 15, 
       :slam_dunks => 10},
      {:name => "DeSagna Diop", 
       :number => 2, 
       :shoe => 14, 
       :points => 24, 
       :rebounds => 12, 
       :assists => 12, 
       :steals => 4, 
       :blocks => 5, 
       :slam_dunks => 5},
      {:name => "Ben Gordon", 
       :number => 8, 
       :shoe => 15, 
       :points => 33, 
       :rebounds => 3, 
       :assists => 2, 
       :steals => 1, 
       :blocks => 1, 
       :slam_dunks => 0},
      {:name => "Kemba Walker", 
      :number => 33, 
      :shoe => 15, 
      :points => 6, 
      :rebounds => 12, 
      :assists => 12, 
      :steals => 7, 
      :blocks => 5, 
      :slam_dunks => 12}
     ]}
}
end


def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:name] == player
        return data[:points]
      end 
    end
  end 
end


def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:name] == player
        return data[:shoe]
      end 
    end  
  end
end 



def team_colors(team)
  game_hash.each do |location, team_data|
    if team == team_data[:team_name]
      return team_data[:colors]
    end 
  end
end 


def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams.push (team_data[:team_name])
  end
  return teams
end 


def player_numbers(team)
  jerseys = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |data|
        jerseys << data[:number]
      end
    end
  end
  jerseys
end


def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:name] == player
        data.delete(:name)
        return data
      end
    end
  end
end


def big_shoe_rebounds
  largest_shoe = 0 
  largest_shoe_rebounds = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:shoe] > largest_shoe
        largest_shoe = data[:shoe]
        largest_shoe_rebounds = data[:rebounds]
      end 
    end 
  end
  largest_shoe_rebounds
end


def most_points_scored
  most_points = 0 
  most_points_player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:points] > most_points
        most_points = data[:points]
        most_points_player = data[:name]
      end
    end
  end
  most_points_player
end


def winning_team
  home_points = 0 
  away_points = 0 
  game_hash[:home][:players].each do |data|
      home_points += data[:points]
  end
  game_hash[:away][:players].each do |data|
      away_points += data[:points]
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end



def player_with_longest_name
  longest_name_player = ""
  longest_name_length = 0 
  game_hash.each do |location, team_info|
    team_info[:players].each do |data|
      if data[:name].length > longest_name_length
        longest_name_length = data[:name].length
        longest_name_player = data[:name]
      end
    end
  end
  longest_name_player
end


def long_name_steals_a_ton?
  most_steals = 0 
  most_steals_player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:steals] > most_steals
        most_steals = data[:steals]
        most_steals_player = data[:name]
      end
    end
  end
  if most_steals_player == player_with_longest_name
    return TRUE
  end
end





