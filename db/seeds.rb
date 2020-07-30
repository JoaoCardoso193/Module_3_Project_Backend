User.destroy_all
Robot.destroy_all
Part.destroy_all
Move.destroy_all
RobotPart.destroy_all
RobotMove.destroy_all
# UserRobot.destroy_all

User.reset_pk_sequence
Robot.reset_pk_sequence
Part.reset_pk_sequence
Move.reset_pk_sequence
RobotPart.reset_pk_sequence
RobotMove.reset_pk_sequence
# UserRobot.reset_pk_sequence


u1 = User.create(user_name: 'JC193')
u2 = User.create(user_name: 'Mr. Chungus')

#Making all parts
p1 = Part.create(name: 'Sun God', image_url: 'images/head_1.png', description: 'A good offensive choice', category: 'head', health: 15, speed: 20, attack: 25, defense: 15, battery_life: 25)
p2 = Part.create(name: 'Blade Bod', image_url: 'images/torso_1.png', description: 'A good offensive choice', category: 'torso', health: 15, speed: 20, attack: 25, defense: 15, battery_life: 25)
p3 = Part.create(name: 'Hoverboard', image_url: 'images/lower_body_1.png', description: 'A good offensive choice', category: 'lower_body', health: 15, speed: 20, attack: 25, defense: 15, battery_life: 25)

p4 = Part.create(name: 'Interceptor', image_url: 'images/head_2.png', description: 'An all around balanced choice', category: 'head', health: 25, speed: 15, attack: 15, defense: 20, battery_life: 25)
p5 = Part.create(name: 'Blaster', image_url: 'images/torso_2.png', description: 'An all around balanced choice', category: 'torso', health: 25, speed: 15, attack: 15, defense: 20, battery_life: 25)
p6 = Part.create(name: 'Rocket', image_url: 'images/lower_body_2.png', description: 'An all around balanced choice', category: 'lower_body', health: 25, speed: 15, attack: 15, defense: 20, battery_life: 25)

p7 = Part.create(name: 'Moon Spirit', image_url: 'images/head_3.png', description: 'A good defensive choice', category: 'head', health: 25, speed: 10, attack: 10, defense: 25, battery_life: 30)
p8 = Part.create(name: 'Samurai', image_url: 'images/torso_3.png', description: 'A good defensive choice', category: 'torso', health: 25, speed: 10, attack: 10, defense: 25, battery_life: 30)
p9 = Part.create(name: 'Based', image_url: 'images/lower_body_3.png', description: 'A good defensive choice', category: 'lower_body', health: 25, speed: 10, attack: 10, defense: 25, battery_life: 30)

#Making all moves
m1 = Move.create(name: 'Digital Blast', summary: 'attacking the opponent', description: 'A strong offensive move   ', category: 'offensive', target: 'other', stat: 'health', value: 20, cost: 6)
m2 = Move.create(name: 'Metal Punch', summary: 'attacking the opponent', description: 'A balanced offensive move', category: 'offensive', target: 'other', stat: 'health', value: 10, cost: 3)
m3 = Move.create(name: 'Attack Boost', summary: 'buffing attack', description: "Raises user's attack", category: 'stat-based', target: 'self', stat: 'attack', value: 50, cost: 7)
m4 = Move.create(name: 'Defense Boost', summary: 'buffing defense', description: "Raises user's defense", category: 'stat-based', target: 'self', stat: 'defense', value: 50, cost: 7)
m5 = Move.create(name: 'Slow Down', summary: "lowering the opponent's speed", description: "Lower's opponent's speed", category: 'stat-based', target: 'other', stat: 'speed', value: -50, cost: 7)
m6 = Move.create(name: 'Intimidate', summary: "lowering the opponent's attack", description: "Lower's opponent's attack", category: 'stat-based', target: 'other', stat: 'attack', value: -33, cost: 7)
m7 = Move.create(name: 'Flirt', summary: "lowering the opponent's attack", description: "Lower's opponent's attack", category: 'stat-based', target: 'other', stat: 'attack', value: -33, cost: 7)
m8 = Move.create(name: 'Recharge', summary: "recharging their battery", description: "Recharges battery", category: 'stat-based', target: 'self', stat: 'battery_life', value: 30, cost: 2)


# robot 1 and associated parts
r1 = u1.create_robot('Phoenix')

rp1 = RobotPart.create(robot_id: r1.id, part_id: p1.id)
rp2 = RobotPart.create(robot_id: r1.id, part_id: p2.id)
rp3 = RobotPart.create(robot_id: r1.id, part_id: p3.id)

rm1 = RobotMove.create(robot_id: r1.id, move_id: m1.id)
rm2 = RobotMove.create(robot_id: r1.id, move_id: m2.id)
rm3 = RobotMove.create(robot_id: r1.id, move_id: m3.id)

r1.get_stats

#robot 2 and associated parts
r2 = u1.create_robot('Jet')

rp4 = RobotPart.create(robot_id: r2.id, part_id: p4.id)
rp5 = RobotPart.create(robot_id: r2.id, part_id: p5.id)
rp6 = RobotPart.create(robot_id: r2.id, part_id: p6.id)

rm4 = RobotMove.create(robot_id: r2.id, move_id: m1.id)
rm5 = RobotMove.create(robot_id: r2.id, move_id: m7.id)
rm6 = RobotMove.create(robot_id: r2.id, move_id: m8.id)

r2.get_stats

#robot 3 and associated parts
r3 = u1.create_robot('Luna')

rp7 = RobotPart.create(robot_id: r3.id, part_id: p7.id)
rp8 = RobotPart.create(robot_id: r3.id, part_id: p8.id)
rp9 = RobotPart.create(robot_id: r3.id, part_id: p9.id)

rm7 = RobotMove.create(robot_id: r3.id, move_id: m1.id)
rm8 = RobotMove.create(robot_id: r3.id, move_id: m5.id)
rm9 = RobotMove.create(robot_id: r3.id, move_id: m4.id)

r3.get_stats

#robot 4 and associated parts
r4 = u2.create_robot('Big Chungus')

rp10 = RobotPart.create(robot_id: r4.id, part_id: p1.id)
rp11 = RobotPart.create(robot_id: r4.id, part_id: p8.id)
rp12 = RobotPart.create(robot_id: r4.id, part_id: p3.id)

rm7 = RobotMove.create(robot_id: r4.id, move_id: m2.id)
rm8 = RobotMove.create(robot_id: r4.id, move_id: m6.id)
rm9 = RobotMove.create(robot_id: r4.id, move_id: m7.id)

r4.get_stats







#associating users and robots

# #Authored
# ur1 = UserRobot.create(user_id: u1.id, robot_id: r1.id)
# ur2 = UserRobot.create(user_id: u1.id, robot_id: r2.id)
# ur3 = UserRobot.create(user_id: u1.id, robot_id: r3.id)
# ur4 = UserRobot.create(user_id: u2.id, robot_id: r4.id)

#Saved
# ur5 = UserRobot.create(user_id: u2.id, robot_id: r1.id)