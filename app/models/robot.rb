class Robot < ApplicationRecord
    has_many :robot_parts
    has_many :parts, through: :robot_parts

    has_many :robot_moves
    has_many :moves, through: :robot_moves

    belongs_to :user

    validates :name, presence: true

    before_destroy :destroy_associations #destroy all associated joiners

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

    def destroy_associations
        #destroying robot_part associations
        robot_parts = RobotPart.all.select{|robot_part| robot_part.robot_id == self.id}
        robot_parts.each do |robot_part|
            robot_part.destroy
        end

        #destroying robot_move associations
        robot_moves = RobotMove.all.select{|robot_move| robot_move.robot_id == self.id}
        robot_moves.each do |robot_move|
            robot_move.destroy
        end
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
