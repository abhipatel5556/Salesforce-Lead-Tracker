public class LeadQualificationHandler {

    // Method to qualify leads and assign follow-up tasks
    public static void qualifyLeads(List<Lead__c> leadList) {
        List<Task> tasksToInsert = new List<Task>();

        for (Lead__c lead : leadList) {
            if (lead.Lead_Score__c >= 50 && lead.Qualification_Status__c != 'Qualified') {
                lead.Qualification_Status__c = 'Qualified';

                // Create a follow-up task for the lead owner
                Task followUp = new Task(
                    Subject = 'Follow up with qualified lead: ' + lead.Name,
                    WhatId = lead.Id,
                    OwnerId = lead.OwnerId,
                    Status = 'Not Started',
                    Priority = 'High'
                );
                tasksToInsert.add(followUp);
            }
        }

        if (!tasksToInsert.isEmpty()) {
            insert tasksToInsert;
        }
    }
}
