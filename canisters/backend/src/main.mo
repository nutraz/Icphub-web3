import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Int "mo:base/Int";
import Storage "canister:storage_canister";
import BountyCanister "canister:bounty_canister";

actor Backend {

    // Define the public Repository type for this canister
    public type Repository = {
        id: Nat;
        name: Text;
        description: Text;
        owner: Principal;
        created_at: Int; // Represents seconds since epoch
    };

    public shared(msg) func create_repository(name: Text, description: Text) : async Nat {
        let owner = msg.caller;
        let repo_id = await Storage.create_repo(name, description, owner);
        return repo_id;
    };

    public shared func get_repository(id: Nat) : async ?Repository {
        // The canister import will handle the type mapping automatically.
        // The types are now compatible.
        return await Storage.get_repo(id);
    };

    // --- Bounty Functions ---

    public shared(msg) func create_bounty(repo_id: Nat, issue_id: Nat, amount: Nat) : async Nat {
        let caller_principal = msg.caller;
        // In a real implementation, we would check if the repo exists and if the caller has permissions.
        // For this PoC, we just forward the call to the bounty canister.
        let bounty_id = await BountyCanister.create_bounty(repo_id, issue_id, amount, caller_principal);
        return bounty_id;
    };

    // Define the public Bounty type for this canister
    public type Bounty = {
        id: Nat;
        repo_id: Nat;
        issue_id: Nat;
        amount: Nat;
        creator: Principal;
        created_at: Int;
        status: {
            #Open;
            #Claimed;
            #Cancelled;
        };
    };

    public shared func get_bounty(id: Nat) : async ?Bounty {
        return await BountyCanister.get_bounty(id);
    };
};
