# -------------------------
# Implementations
# -------------------------

impl Patient.start {
    print(f"Patient {self.id} spawned. Emergency: {self.is_emergency}");
    visit [-->];   # root -> reception
}

impl reception.check {
    if visitor.is_emergency {
        print(f"[Reception] Patient {visitor.id} is an EMERGENCY — skipping queue and going to doctor.");
        # Jump directly to doctor
        visit [-->];  
    } else {
        print(f"[Reception] Patient {visitor.id} is a regular patient — joins the queue (simulated).");
        # Normal patients also go to doctor, but this simulates the wait
        visit [-->];
    }
}
impl queue.join {
    if visitor.is_emergency {
        print(f"[Reception] Patient {visitor.id} is an EMERGENCY — skipping queue and going to doctor.");
        # Jump directly to doctor
        visit [-->];  
    } else {
        print(f"[Reception] Patient {visitor.id} is a regular patient — joins the queue (simulated).");
        # Normal patients also go to doctor, but this simulates the wait
        visit [-->];
    }
}

impl doctor.consult {
    if visitor.is_emergency {
        print(f"[Doctor] Treating EMERGENCY patient {visitor.id} immediately.");
    } else {
        print(f"[Doctor] Examining patient {visitor.id}.");
    }
    visit [-->];   # next is pharmacy
}

impl pharmacy.dispense {
    print(f"[Pharmacy] Dispensing medication to patient {visitor.id}. Patient {visitor.id} done.");
    disengage;
}
