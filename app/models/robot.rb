class Robot < ApplicationRecord
    has_many :robot_parts
    has_many :parts, through: :robot_parts

    has_many :robot_moves
    has_many :moves, through: :robot_moves

    has_many :user_robots
    has_many :users, through: :user_robots

    validates :name, presence: true


    def get_stats        
        #health
        parts_health = self.parts.map{|part| part.health}
        health_total = get_total(parts_health)

        #speed
        parts_speed = self.parts.map{|part| part.speed}
        speed_total = get_total(parts_speed)

        #attack
        parts_attack = self.parts.map{|part| part.attack}
        attack_total = get_total(parts_attack)

        #defense
        parts_defense = self.parts.map{|part| part.defense}
        defense_total = get_total(parts_defense)

        #battery_life
        parts_battery_life = self.parts.map{|part| part.battery_life}
        battery_life_total = get_total(parts_battery_life)

        grand_total = health_total + speed_total + attack_total + defense_total + battery_life_total

        #Normalizing stats
        self.health = health_total / grand_total * 100
        self.speed = speed_total / grand_total * 100
        self.attack = attack_total / grand_total * 100
        self.defense = defense_total / grand_total * 100
        self.battery_life = battery_life_total / grand_total * 100
        self.save
    end

    private
    
    def get_total(parts_stat)
        total = 0
        parts_stat.each do |value|
            total += value
        end
        total
    end
end
