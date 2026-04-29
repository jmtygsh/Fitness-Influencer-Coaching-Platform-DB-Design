users [color: teal] {
  id serial pk
  full_name varchar(100) not null
  email varchar(120) unique not null
  phone varchar(20)
  role varchar(20) not null
  created_at timestamp
}

trainer_profiles [color: cyan] {
  id serial pk
  user_id int fk
  bio text
  specialization varchar(100)
  consultation_fee decimal(10,2)
}

client_profiles [color: blue] {
  id serial pk
  user_id int fk
  assigned_trainer_id int fk
  join_date date
  primary_goal varchar(150)
}

coaching_plans [color: orange] {
  id serial pk
  trainer_id int fk
  name varchar(120) not null
  description text
  duration_weeks int
  price decimal(10,2) not null
  includes_live_sessions boolean
}

plan_resources [color: yellow] {
  id serial pk
  plan_id int fk
  resource_type varchar(30) not null
  title varchar(120) not null
  content text
}

subscriptions [color: gold] {
  id serial pk
  client_id int fk
  plan_id int fk
  start_date date
  end_date date
  status varchar(30) not null
}

sessions [color: violet] {
  id serial pk
  trainer_id int fk
  client_id int fk
  session_type varchar(30) not null
  scheduled_at timestamp
  meeting_link varchar(255)
  status varchar(30) not null
}

check_ins [color: purple] {
  id serial pk
  client_id int fk
  trainer_id int fk
  submitted_at timestamp
  weight decimal(5,2)
  energy_level varchar(30)
  adherence_score int
  notes text
}

progress_logs [color: green] {
  id serial pk
  client_id int fk
  weight decimal(5,2)
  chest decimal(5,2)
  waist decimal(5,2)
  hips decimal(5,2)
  arms decimal(5,2)
  thighs decimal(5,2)
  logged_at timestamp
}

trainer_notes [color: red] {
  id serial pk
  client_id int fk
  trainer_id int fk
  check_in_id int fk
  note text
  created_at timestamp
}

payments [color: amber] {
  id serial pk
  subscription_id int fk
  amount decimal(10,2) not null
  payment_method varchar(50)
  payment_status varchar(30)
  paid_at timestamp
}

users.id > trainer_profiles.user_id
users.id > client_profiles.user_id

trainer_profiles.id > client_profiles.assigned_trainer_id

trainer_profiles.id > coaching_plans.trainer_id
coaching_plans.id > plan_resources.plan_id

client_profiles.id > subscriptions.client_id
coaching_plans.id > subscriptions.plan_id

trainer_profiles.id > sessions.trainer_id
client_profiles.id > sessions.client_id

client_profiles.id > check_ins.client_id
trainer_profiles.id > check_ins.trainer_id

client_profiles.id > progress_logs.client_id

client_profiles.id > trainer_notes.client_id
trainer_profiles.id > trainer_notes.trainer_id
check_ins.id > trainer_notes.check_in_id

subscriptions.id > payments.subscription_id
