import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Int "mo:base/Int";

actor Storage {

    public type RepoId = Nat;

    public type Repository = {
        id: RepoId;
        name: Text;
        description: Text;
        owner: Principal;
        created_at: Int; // Store as seconds since epoch
    };

    private var repositories = HashMap.HashMap<Text, Repository>(0, Text.equal, Text.hash);
    private var nextRepoId : RepoId = 0;

    public shared func create_repo(name: Text, description: Text, owner: Principal) : async RepoId {
        let repo_id = nextRepoId;
        let new_repo : Repository = {
            id = repo_id;
            name = name;
            description = description;
            owner = owner;
            created_at = Time.now(); // Store time in seconds as an Int
        };
        repositories.put(Nat.toText(repo_id), new_repo);
        nextRepoId += 1;
        return repo_id;
    };

    public query func get_repo(id: RepoId) : async ?Repository {
        return repositories.get(Nat.toText(id));
    };
};
