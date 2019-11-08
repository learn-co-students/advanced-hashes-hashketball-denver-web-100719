require 'pry'

def game_hash()
  game_hash = {}
  game_hash = 
    {:home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
          {:players_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 },
        {:players_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 },
        {:players_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15 },
        {:players_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 },
        {:players_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 }]
       },
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => [
        {:players_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 },
        {:players_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 },
        {:players_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5 },
        {:players_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0 },
        {:players_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12 }]}
    }
end

def num_points_scored(name)
  game_hash.each do |location, team|
    team[:players].each do |player|
      if player[:players_name] == name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team|
    team[:players].each do |player|
      if player[:players_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    if team[:team_name] == team_name
    return team[:colors]
    end
  end
end

def team_names
  name_array = []
  game_hash.each do |location, team|
    name_array << team[:team_name]
  end
  name_array
end

def player_numbers(team_name)
  numbers_array = []
  game_hash.each do |location, team|
    if team[:team_name]  == team_name
      team.each do |players, stats|
        if players == :players
          stats.each do |player|
          numbers_array << player[:number]
          end
        end
      end
    end
  end
  numbers_array
end
  
def player_stats(player_name)
  stats_hash = {}
  game_hash.each do |location, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
      if player[:players_name] == player_name
        stats_hash = player.delete_if {|key, value| key == :players_name}
      end
      end
      end
    end
  end
  stats_hash
end
  
def big_shoe_rebounds
biggest = 0
rebounds = 0
  game_hash.each do |location, team|
    team[:players].each do |player|
      size = player[:shoe]
      if size > biggest
        biggest = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  biggest = 0 
  best_player = []
  game_hash.each do |location, team|
    team[:players].each do |player|
      success = player[:points]
      if success > biggest
        biggest = success
        best_player = player[:players_name]
      end
    end
  end
  best_player
end

def winning_team 
  home_points = []
  game_hash[:home][:players].each do |player|
    home_points << player[:points]
  end
  away_points = []
  game_hash[:away][:players].each do |player|
    away_points << player[:points]
  end
  best_team = []
  if home_points.reduce(:+) > away_points.reduce(:+)
    best_team = game_hash[:home][:team_name]
  else
    best_team = game_hash[:away][:team_name]
  end
  best_team
end

def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:players_name].length
      if name_length > longest_length
        longest_length = name_length
        longest = player[:players_name]
      end
    end
  end
  return longest
end

def long_name_steals_a_ton?
  most_steals = ""
  steals = 0 
   game_hash.each do |location, team|
    team[:players].each do |player|
      success = player[:steals]
      if success > steals
        steals = success
        most_steals = player[:players_name]
      end
    end 
  end 
  return true if most_steals == player_with_longest_name
end
  
  
  
  
  
  
  
  
  
  
  
  
  



