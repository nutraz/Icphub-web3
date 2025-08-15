import Debug "mo:base/Debug";
import Backend "canister:backend_canister";

actor Test {

    public func testCreateAndGetRepository() : async () {
        Debug.print("--- Running test: testCreateAndGetRepository ---");

        // Create a new repository
        let repo_id = await Backend.create_repository("test-repo", "A test repository");
 assert(repo_id == 0);

        // Get the repository
        let repo = await Backend.get_repository(repo_id);

        switch (repo) {
            case (null) { Debug.trap("Repository not found after creation"); };
            case (?r) {
 assert(r.id == repo_id);
 assert(r.name == "test-repo");
 assert(r.description == "A test repository");
            };
        };

        Debug.print("--- Test passed: testCreateAndGetRepository ---");
    };

    public func testCreateAndGetBounty() : async () {
        Debug.print("--- Running test: testCreateAndGetBounty ---");

        // Create a bounty for a repository and issue
        let repo_id = 0; // Assuming the repo from the previous test
        let issue_id = 42;
        let amount = 100;
        let bounty_id = await Backend.create_bounty(repo_id, issue_id, amount);
 assert(bounty_id == 0);

        // Get the bounty
        let bounty = await Backend.get_bounty(bounty_id);

        switch (bounty) {
            case (null) { Debug.trap("Bounty not found after creation"); };
            case (?b) {
 assert(b.id == bounty_id);
 assert(b.repo_id == repo_id);
 assert(b.issue_id == issue_id);
 assert(b.amount == amount);
 assert(b.status == #Open);
            };
        };

        Debug.print("--- Test passed: testCreateAndGetBounty ---");
    };
};

