import random;

walker Patient {
    has id: int;
    has is_emergency: bool = False;

    can start with `root entry;
}

node reception {
    can check with Patient entry;
}

node queue {
    can join with Patient entry;
}
node doctor {
    can consult with Patient entry;
}

node pharmacy {
    can dispense with Patient entry;
}

with entry {
    # Build the hospital graph
    reception_node = spawn reception;
    queue_node = spawn queue;
    doctor_node = spawn doctor;
    pharmacy_node = spawn pharmacy;

    # connect the flow: root → reception → doctor → pharmacy
    root ++> reception_node;
    reception_node ++>queue_node;
    queue_node ++>  doctor_node;
    doctor_node ++> pharmacy_node;

    # Spawn patients (10 total, 20% emergencies)
    for i = 1 to i <= 10 by i += 1 {
        is_em = (random.randint(1, 10) <= 2);   # 20% chance
        root spawn Patient(i, is_em);
    }
}
