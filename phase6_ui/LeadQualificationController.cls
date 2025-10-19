public class LeadQualificationController {
    public Lead leadRecord { get; set; }

    public LeadQualificationController() {
        leadRecord = new Lead();
    }

    public PageReference markQualified() {
        leadRecord.Status = 'Qualified';
        update leadRecord;
        return null;
    }
}
