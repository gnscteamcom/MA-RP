
local cfg = {}

-- city hall position
cfg.city_hall =	{-545.97473144531,-206.52598571777,38.148094177246}

-- cityhall blip {blipid,blipcolor}
cfg.blip = {498,1}

-- cost of a new identity
cfg.new_identity_cost = 2000

-- phone format (max: 20 chars, use D for a random digit)
cfg.phone_format = "508-97D-DDDD"
-- cfg.phone_format = "06DDDDDDDD" -- another example for cellphone in France


-- config the random name generation (first join identity)
-- (I know, it's a lot of names for a little feature)
-- (cf: http://names.mongabay.com/most_common_surnames.htm)
cfg.random_first_names = {
  "JAMES",
  "JOHN",
  "ROBERT",
  "MICHAEL",
  "WILLIAM",
  "DAVID",
  "RICHARD",
  "CHARLES",
  "JOSEPH",
  "THOMAS",
  "CHRISTOPHER",
  "DANIEL",
  "PAUL",
  "MARK",
  "DONALD",
  "GEORGE",
  "KENNETH",
  "STEVEN",
  "EDWARD",
  "BRIAN",
  "RONALD",
  "ANTHONY",
  "KEVIN",
  "JASON",
  "MATTHEW",
  "GARY",
  "TIMOTHY",
  "JOSE",
  "LARRY",
  "JEFFREY",
  "FRANK",
  "SCOTT",
  "Derrick"
}

cfg.random_last_names = {
  "Smith",
"Johnson",
"Williams",
"Jones",
"Brown",
"Davis",
"Miller",
"Wilson",
"Moore",
"Taylor",
"Anderson",
"Thomas",
"Jackson",
"White",
"Harris",
"Martin",
"Thompson",
"Garcia",
"Martinez",
"Robinson",
"Clark",
"Rodriguez",
"Lewis",
"Lee",
"Walker"
}

return cfg
