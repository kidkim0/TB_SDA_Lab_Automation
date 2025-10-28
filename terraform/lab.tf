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
  configuration = "System Bridge"
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

resource "cml2_link" "ext_to_unmanaged" {
  lab_id = cml2_lab.testlab.id
  node_a = cml2_node.ext.id
  slot_a = 0
  node_b = cml2_node.unmanaged.id
}

resource "cml2_link" "sw1_to_unmanaged" {
  lab_id = cml2_lab.testlab.id
  node_a = cml2_node.sw1.id
  slot_a = 0
  node_b = cml2_node.unmanaged.id
}

resource "cml2_link" "sw2_to_unmanaged" {
  lab_id = cml2_lab.testlab.id
  node_a = cml2_node.sw2.id
  slot_a = 0
  node_b = cml2_node.unmanaged.id
}

resource "cml2_link" "sw3_to_unmanaged" {
  lab_id = cml2_lab.testlab.id
  node_a = cml2_node.sw3.id
  slot_a = 0
  node_b = cml2_node.unmanaged.id
}

resource "cml2_lifecycle" "top" {
  lab_id = cml2_lab.testlab.id
  depends_on = [
    cml2_node.sw1,
    cml2_node.sw2,
    cml2_node.sw3,
    cml2_node.ext,
    cml2_node.unmanaged,
    cml2_link.sw1_to_unmanaged,
    cml2_link.sw2_to_unmanaged,
    cml2_link.sw3_to_unmanaged,
    cml2_link.ext_to_unmanaged,
  ]
  state = "STARTED"
  wait = false
}
