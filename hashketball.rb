require 'pry'
def game_hash
  hash = {home: {
    :team_name => "Brooklyn Nets", 
    :colors => ["Black","White"], 
    :players => [
      "Alan Anderson"=>{
        number: 0, 
        shoe: 16, 
        points: 22, 
        rebounds: 12, 
        assists: 12, 
        steals: 3, 
        blocks: 1, 
        slam_dunks: 1
        },
      "Reggie Evans"=>{
        number: 30, 
        shoe: 14, 
        points: 12, 
        rebounds: 12, 
        assists: 12, 
        steals: 12, 
        blocks: 12, 
        slam_dunks: 7
      },
      "Brook Lopez"=>{
        number: 11, 
        shoe: 17, 
        points: 17, 
        rebounds: 19, 
        assists: 10, 
        steals: 3, 
        blocks: 1, 
        slam_dunks: 15
      },
      "Mason Plumlee"=>{
        number: 1, 
        shoe: 19, 
        points: 26, 
        rebounds: 11, 
        assists: 6, 
        steals: 3, 
        blocks:8, 
        slam_dunks: 5
      },
      "Jason Terry"=>{
        number: 31, 
        shoe: 15, 
        points: 19, 
        rebounds: 2, 
        assists: 2, 
        steals: 4, 
        blocks: 11, 
        slam_dunks: 1
      }
    ]
  }, 
  away: {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"], 
    :players => [
      "Jeff Adrien"=>{
        number: 4, 
        shoe: 18, 
        points: 10, 
        rebounds: 1, 
        assists: 1, 
        steals: 2, 
        blocks: 7, 
        slam_dunks: 2
      },
      "Bismack Biyombo"=>{
        number: 0, 
        shoe: 16, 
        points: 12, 
        rebounds: 4, 
        assists: 7, 
        steals: 22, 
        blocks: 15, 
        slam_dunks: 10
      },
      "DeSagna Diop"=>{
        number: 2, 
        shoe: 14, 
        points: 24, 
        rebounds: 12, 
        assists: 12, 
        steals: 4, 
        blocks: 5, 
        slam_dunks: 5
      },
      "Ben Gordon"=>{
        number: 8, 
        shoe: 15, 
        points: 33, 
        rebounds: 3, 
        assists: 2, 
        steals: 1, 
        blocks: 1, 
        slam_dunks: 0
      },
      "Kemba Walker" =>{
        number:33, 
        shoe: 15, 
        points: 6, 
        rebounds: 12, 
        assists: 12,  
        steals: 7, 
        blocks: 5, 
        slam_dunks: 12
      }
    ]
  }
  }
  
  hash
end

def num_points_scored(player)
  library = game_hash
  library.each do |home, team|
    team.each do |team_stats, players|
      if team_stats == :players
        players.each do |player_name|
          player_name.each do |name, stats|
            if name == player
              return stats[:points]
            end
          end
        end
      end
    end 
  end
end

def shoe_size(player_name)
  library = game_hash
  library.each do |home, team| 
    team.each do |team_stats, players|
      if team_stats == :players
        players.each do |name|
          name.each do |names, stats|
            if names == player_name
              return stats[:shoe]
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  library = game_hash
  library.each do |location, team|
    team.each do |team_stat, player|
      if team_stat == :team_name
        if player == team_name
          return team[:colors]
        end
      end
    end
  end
end

def team_names
  game_hash.map do |location, team|
    team[:team_name]
  end
end
  
def player_numbers(team_name)
  library = game_hash
  nums = []
  library.each do |home, team| 
    if team[:team_name] == team_name
      team.each do |team_stats, players|
        if team_stats == :players
          players.each do |name|
            name.each do |names, stats|
              nums << stats[:number]
            end
          end
        end
      end
    end
  end
  nums
end

def player_stats(player_name)
  new_hash = {}
  game_hash.each do |location, team|
    team.each do |name, stats|
      if name == :players
        stats.each do |names|
          names.each do |n, s|
            if n == player_name
              new_hash = s
            end
          end
        end
      end
    end
  end
  new_hash
end
          
def big_shoe_rebounds
  shoe_size = []
  game_hash.each do |home, team| 
    team.each do |team_stats, players|
      if team_stats == :players
        players.each do |name|
          name.each do |names, stats|
            shoe_size << stats[:shoe]
          end
        end
      end
    end
  end
  game_hash.each do |k,v|
    v.each do |k,v|
      if k == :players
        v.each do |name|
          name.each do |k, v|
            if v[:shoe] == shoe_size.max
              return v[:rebounds]
            end
          end
        end
      end
    end
  end
end

def most_points_scored
  points = []
  game_hash.each do |home, team| 
    team.each do |team_stats, players|
      if team_stats == :players
        players.each do |name|
          name.each do |names, stats|
            points << stats[:points]
          end
        end
      end
    end
  end
  game_hash.each do |k,v|
    v.each do |k,v|
      if k == :players
        v.each do |name|
          name.each do |k, v|
            if v[:points] == points.max
              return k
            end
          end
        end
      end
    end
  end
end

def winning_team
  home_team =[]
  away_team = []
  game_hash.each do |home, team|
    if home == :home
      team.each do |team_stats, players|
        if team_stats == :players
          players.each do |name|
            name.each do |names, stats|
              home_team << stats[:points]
            end
          end
        end
      end
    else
      team.each do |team_stats,players|
        if team_stats ==:players
          players.each do |name|
            name.each do |names, stats|
              away_team << stats[:points]
            end
          end
        end
      end
    end
  end
  home_pts = home_team.reduce(0){|sum, num| sum + num}
  away_pts = away_team.reduce(0){|sum, num| sum + num}
  if home_pts > away_pts 
    game_hash[:home][:team_name]
    else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = []
  game_hash.each do |home, team| 
    team.each do |team_stats, players|
      if team_stats == :players
        players.each do |name|
          name.each do |names, stats|
            name_length << names.length
          end
        end
      end
    end
  end
  game_hash.each do |k,v|
    v.each do |k,v|
      if k == :players
        v.each do |name|
          name.each do |k, v|
            if k.length == name_length.max
              return k
            end
          end
        end
      end
    end
  end
end

def long_name_steals_a_ton?
  name_length = []
  player_steals = []
  most_steals = []
  game_hash.each do |home, team| 
    team.each do |team_stats, players|
      if team_stats == :players
        players.each do |name|
          name.each do |names, stats|
            name_length << names.length
          end
        end
      end
    end
  end
  game_hash.each do |k,v|
    v.each do |k,v|
      if k == :players
        v.each do |name|
          name.each do |k, v|
            if k.length == name_length.max
              player_steals = v[:steals]
            end
          end
        end
      end
    end
  end
  game_hash.each do |home, team| 
    team.each do |team_stats, players|
      if team_stats == :players
        players.each do |name|
          name.each do |names, stats|
            most_steals << stats[:steals]
          end
        end
      end
    end
  end
  player_steals >= most_steals.max ? TRUE: FALSE
end