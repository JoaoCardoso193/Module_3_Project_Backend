User.destroy_all
Robot.destroy_all
Part.destroy_all
RobotPart.destroy_all
RobotMove.destroy_all
UserRobot.destroy_all

User.reset_pk_sequence
Robot.reset_pk_sequence
Part.reset_pk_sequence
RobotPart.reset_pk_sequence
RobotMove.reset_pk_sequence
UserRobot.reset_pk_sequence


u1 = User.create(user_name: 'main_user')
u2 = User.create(user_name: 'tester')

#Making all parts
p1 = Part.create(name: 'head 1', image_url: 'images/robot_head.png', description: 'head 1 description', category: 'head', health: 5, speed: 20, attack: 20, defense: 5, battery_life: 20)
p2 = Part.create(name: 'torso 1', image_url: 'images/robot_torso.png', description: 'torso 1 description', category: 'torso', health: 5, speed: 20, attack: 20, defense: 5, battery_life: 20)
p3 = Part.create(name: 'lower_body 1', image_url: 'images/robot_lower_body.png', description: 'lower_body 1 description', category: 'lower_body', health: 5, speed: 20, attack: 20, defense: 5, battery_life: 20)

p4 = Part.create(name: 'head 2', image_url: 'images/robot_head.png', description: 'head 2 description', category: 'head', health: 20, speed: 5, attack: 5, defense: 20, battery_life: 5)
p5 = Part.create(name: 'torso 2', image_url: 'images/robot_torso.png', description: 'torso 2 description', category: 'torso', health: 20, speed: 5, attack: 5, defense: 20, battery_life: 5)
p6 = Part.create(name: 'lower_body 2', image_url: 'images/robot_lower_body.png', description: 'lower_body 2 description', category: 'lower_body', health: 20, speed: 5, attack: 5, defense: 20, battery_life: 5)

p7 = Part.create(name: 'head 3', image_url: 'images/robot_head.png', description: 'head 3 description', category: 'head', health: 10, speed: 10, attack: 10, defense: 10, battery_life: 10)
p8 = Part.create(name: 'torso 3', image_url: 'images/robot_torso.png', description: 'torso 3 description', category: 'torso', health: 10, speed: 10, attack: 10, defense: 10, battery_life: 10)
p9 = Part.create(name: 'lower_body 3', image_url: 'images/robot_lower_body.png', description: 'lower_body 3 description', category: 'lower_body', health: 10, speed: 10, attack: 10, defense: 10, battery_life: 10)

#Making all moves
m1 = Move.create(name: 'offensive 1', summary: 'attacking the opponent', description: 'move 1 description', category: 'offensive', target: 'other', stat: 'health', value: 20, cost: 5)
m2 = Move.create(name: 'offensive 2', summary: 'attacking the opponent', description: 'move 2 description', category: 'offensive', target: 'other', stat: 'health', value: 10, cost: 2)
m3 = Move.create(name: 'attack-boost', summary: 'buffing attack', description: 'move 3 description', category: 'stat-based', target: 'self', stat: 'attack', value: 20, cost: 4)
m4 = Move.create(name: 'defense-boost', summary: 'buffing defense', description: 'move 4 description', category: 'stat-based', target: 'self', stat: 'defense', value: 20, cost: 4)
m5 = Move.create(name: 'slow-down', summary: "lowering the opponent's speed", description: 'move 5 description', category: 'stat-based', target: 'other', stat: 'speed', value: -20, cost: 5)



#robot 1 and associated parts
r1 = u1.create_robot('robot 1')

rp1 = RobotPart.create(robot_id: r1.id, part_id: p1.id)
rp2 = RobotPart.create(robot_id: r1.id, part_id: p2.id)
rp3 = RobotPart.create(robot_id: r1.id, part_id: p3.id)

rm1 = RobotMove.create(robot_id: r1.id, move_id: m1.id)
rm2 = RobotMove.create(robot_id: r1.id, move_id: m2.id)
rm3 = RobotMove.create(robot_id: r1.id, move_id: m3.id)

r1.get_stats

#robot 2 and associated parts
r2 = u1.create_robot('robot 2')

rp4 = RobotPart.create(robot_id: r2.id, part_id: p4.id)
rp5 = RobotPart.create(robot_id: r2.id, part_id: p5.id)
rp6 = RobotPart.create(robot_id: r2.id, part_id: p6.id)

rm4 = RobotMove.create(robot_id: r2.id, move_id: m1.id)
rm5 = RobotMove.create(robot_id: r2.id, move_id: m4.id)
rm6 = RobotMove.create(robot_id: r2.id, move_id: m5.id)

r2.get_stats

#robot 3 and associated parts
r3 = u1.create_robot('robot 3')

rp7 = RobotPart.create(robot_id: r3.id, part_id: p7.id)
rp8 = RobotPart.create(robot_id: r3.id, part_id: p8.id)
rp9 = RobotPart.create(robot_id: r3.id, part_id: p9.id)

rm7 = RobotMove.create(robot_id: r3.id, move_id: m2.id)
rm8 = RobotMove.create(robot_id: r3.id, move_id: m3.id)
rm9 = RobotMove.create(robot_id: r3.id, move_id: m4.id)

r3.get_stats

#robot 4 and associated parts
r4 = u2.create_robot('robot 4')

rp10 = RobotPart.create(robot_id: r4.id, part_id: p1.id)
rp11 = RobotPart.create(robot_id: r4.id, part_id: p5.id)
rp12 = RobotPart.create(robot_id: r4.id, part_id: p6.id)

rm7 = RobotMove.create(robot_id: r4.id, move_id: m2.id)
rm8 = RobotMove.create(robot_id: r4.id, move_id: m3.id)
rm9 = RobotMove.create(robot_id: r4.id, move_id: m4.id)

r4.get_stats

#associating users and robots

#Authored
ur1 = UserRobot.create(user_id: u1.id, robot_id: r1.id)
ur2 = UserRobot.create(user_id: u1.id, robot_id: r2.id)
ur3 = UserRobot.create(user_id: u1.id, robot_id: r3.id)
ur4 = UserRobot.create(user_id: u2.id, robot_id: r4.id)

#Saved
ur5 = UserRobot.create(user_id: u2.id, robot_id: r1.id)