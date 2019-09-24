require "pry"

def game_hash
  statistics = {:home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => [{:name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},{:name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},{:name => "Brook Lopez",:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},{:name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},{:name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}]}, :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => [{:name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},{:name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},{:name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},{:name =>"Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},{:name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12},]}}
end

def num_points_scored(player_name)
  points = nil
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    first_hash[:players].each do |player_hash|
      if(player_hash[:name] == player_name)
        points = player_hash[:points]
      end 
    end 
  end 
  points
end 

def shoe_size(player_name)
  size = nil
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    first_hash[:players].each do |player_hash|
      if(player_hash[:name] == player_name)
        size = player_hash[:shoe]
      end 
    end 
  end 
  size
end 

def team_colors(team)
  color = []
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    if first_hash[:team_name] == team
      first_hash[:colors].each do |value|
        color.push(value)
      end 
    end 
  end 
  color
end 

def team_names
  statistics = game_hash
  teams = []
  statistics.each do |home_away, first_hash|
    teams.push(first_hash[:team_name])
  end 
  teams
end 

def player_numbers(team)
  jersey_numbers = []
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    if first_hash[:team_name] == team
      first_hash[:players].each do |player_hash|
        jersey_numbers.push(player_hash[:number])
      end 
    end 
  end 
  jersey_numbers
end 

def player_stats(player_name)
  player_statistics = {}
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    first_hash[:players].each do |player_hash|
      if player_hash[:name] == player_name
        player_statistics = player_hash
      end 
    end 
  end 
  player_statistics.delete(:name)
  player_statistics
end 

def big_shoe_rebounds
  biggest_shoe_size = 0
  player_biggest_shoe = nil
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    first_hash[:players].each do |player_hash|
      if player_hash[:shoe] > biggest_shoe_size
        biggest_shoe_size = player_hash[:shoe]
        player_biggest_shoe = player_hash[:name]
      end 
    end 
  end 
  
  stats = player_stats(player_biggest_shoe)
  stats[:rebounds]
end

def most_points_scored
  most_points_scored = 0
  player_most_points = nil
  statistics = game_hash  
  statistics.each do |home_away, first_hash|
    first_hash[:players].each do |player_hash|
      if player_hash[:points] > most_points_scored
        most_points_scored = player_hash[:points]
        player_most_points = player_hash[:name]
      end 
    end 
  end 
  player_most_points
end 

def winning_team
  home_team_points = 0
  away_team_points = 0
  statistics = game_hash
  statistics[:home][:players].each do |home_player_hash|
    home_team_points += home_player_hash[:points]
  end 
  statistics[:away][:players].each do |away_player_hash|
    away_team_points += away_player_hash[:points]
  end 
  if home_team_points > away_team_points
    return statistics[:home][:team_name]
  else 
    return statistics[:away][:team_name]
  end 
end 

def player_with_longest_name
  name_length = 0
  player_name = nil
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    first_hash[:players].each do |player_hash|
      if player_hash[:name].length > name_length
        name_length = player_hash[:name].length
        player_name = player_hash[:name]
      end 
    end 
  end 
  player_name
end 

def long_name_steals_a_ton?
  largest_steals = 0
  largest_steals_player = nil
  
  longest_name = player_with_longest_name
  longest_name_stats = player_stats(longest_name)
  longest_name_steals = longest_name_stats[:steals]
  
  statistics = game_hash
  statistics.each do |home_away, first_hash|
    first_hash[:players].each do |player_hash|
      if player_hash[:steals] > largest_steals
        largest_steals = player_hash[:steals]
        largest_steals_player = player_hash[:name]
      end 
    end 
  end 
  
  if largest_steals_player == longest_name
    return true
  else
    return false
  end 
end 