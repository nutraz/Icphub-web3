import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Time "mo:base/Time";
import HashMap "mo:base/HashMap";

actor BountyCanister {

    public type BountyId = Nat;

    public type BountyStatus = {
        #Open;
        #Claimed;
        #Cancelled;
    };

    public type Bounty = {
        id: BountyId;
        repo_id: Nat;
        issue_id: Nat;
        amount: Nat;
        creator: Principal;
        created_at: Int;
        status: BountyStatus;
    };

    private var bounties = HashMap.HashMap<Text, Bounty>(0, Text.equal, Text.hash);
    private var nextBountyId : BountyId = 0;

    // The creator principal is now passed in as an argument
    public shared func create_bounty(repo_id: Nat, issue_id: Nat, amount: Nat, creator: Principal) : async BountyId {
        let bounty_id = nextBountyId;
        let new_bounty : Bounty = {
            id = bounty_id;
            repo_id = repo_id;
            issue_id = issue_id;
            amount = amount;
            creator = creator; // Use the creator passed as an argument
            created_at = Time.now();
            status = #Open;
        };
        bounties.put(Nat.toText(bounty_id), new_bounty);
        nextBountyId += 1;
        return bounty_id;
    };

    public query func get_bounty(id: BountyId) : async ?Bounty {
        return bounties.get(Nat.toText(id));
    };

    public shared func claim_bounty(id: BountyId) : async Bool {
        switch (bounties.get(Nat.toText(id))) {
            case (null) { return false; };
            case (?bounty) {
                if (bounty.status == #Open) {
                    let updated_bounty : Bounty = {
                        id = bounty.id;
                        repo_id = bounty.repo_id;
                        issue_id = bounty.issue_id;
                        amount = bounty.amount;
                        creator = bounty.creator;
                        created_at = bounty.created_at;
                        status = #Claimed;
                    };
                    bounties.put(Nat.toText(id), updated_bounty);
                    return true;
                } else {
                    return false;
                };
            };
        };
    };
};
