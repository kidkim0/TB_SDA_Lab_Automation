resource "cml2_lab" "testlab" {
  title =  "SDA Test Lab"
}

resource "cml2_node" "sw1" {
  lab_id = cml2_lab.testlab.id
  label  = "sw1"
  nodedefinition = "cat9000v-uadp"
  x = 100
  y = 100
}

resource "cml2_node" "sw2" {
  lab_id = cml2_lab.testlab.id
  label  = "sw2"
  nodedefinition = "cat9000v-uadp"
  x = 100
  y = 200
}

resource "cml2_node" "sw3" {
  lab_id = cml2_lab.testlab.id
  label  = "sw3"
  nodedefinition = "cat9000v-uadp"
  x = 100
  y = 300
}

resource "cml2_node" "ext" {
  lab_id = cml2_lab.testlab.id
  label  = "ext"
  nodedefinition = "external_connector"
  configuration = "bidge0"
  x = 0
  y = 100
}

resource "cml2_node" "unmanaged" {
  lab_id = cml2_lab.testlab.id
  label  = "unmanaged"
  nodedefinition = "unmanaged_switch"
  x = 0
  y = 200
}
