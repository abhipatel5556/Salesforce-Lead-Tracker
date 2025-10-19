trigger LeadQualificationTrigger on Lead (after update) {
    List<Lead> qualifiedLeads = new List<Lead>();
    for (Lead l : Trigger.new) {
        if (l.Status == 'Qualified' && Trigger.oldMap.get(l.Id).Status != 'Qualified') {
            qualifiedLeads.add(l);
        }
    }
    if (!qualifiedLeads.isEmpty()) {
        LeadQualificationHandler.assignTaskToOwner(qualifiedLeads);
    }
}
