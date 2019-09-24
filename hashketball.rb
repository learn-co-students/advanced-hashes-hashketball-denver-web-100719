require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
        {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
        {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
        {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },
        {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  #returns number of points for player_name
  game_hash.each do |location, team|
    team.each do |players, data|
      if players == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  #returns shoe size for player_name
  game_hash.each do |location, team|
    team.each do |players, data|
      if players == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  #returns an array of colors for team_name
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  #operates on game_hash to return team names
  game_hash.map do |location, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  #returns an array of numbers for each player for team_name
  numbers = []
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team.each do |players, data|
        if players == :players
          data.each do |player|
            numbers << player[:number]
          end
        end
      end
    end
  end
  numbers
end

def player_stats(players_name)
  #returns hash of stats for player_name
  new_hash = {}
  game_hash.each do |location, team|
    team.each do |players, data|
      if players == :players
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
  #find player with largest shoe size
  #return players rebounds
  max = 0
  rebounds = 0
  game_hash.each do |location, team|
    team.each do |players, data|
      if players == :players
        data.each do |player_data|
          size = player_data[:shoe]
          if size > max
            max = size
            rebounds = player_data[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored

most_points = 0
most_points_player = ""
game_hash.each do |location, team|
  team.each do |players, data|
    if players == :players
      data.each do |player_data|
        points = player_data[:points]
        if points > most_points
          most_points = points
          most_points_player = player_data[:player_name]
        end
      end
    end
  end
end
most_points_player
end

def winning_team
  most_points = 0
  most_points_team = ""
  game_hash.each do |location, team|
    team.each do |players, data|
      if players == :players
        data.each do |player_data|
          points = player_data[:points]

  end
