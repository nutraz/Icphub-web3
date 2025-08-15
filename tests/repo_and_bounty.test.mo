import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import Backend "canister:backend_canister";

actor Test {

    // Helper function for assertions
    func assert(condition: Bool, message: Text) {
        if (not condition) {
            Debug.trap(message);
        };
    };

    public func testCreateAndGetRepository() : async () {
        Debug.print("--- Running test: testCreateAndGetRepository ---");

        // Create a new repository
        let repo_id = await Backend.create_repository("test-repo", "A test repository");
        assert(repo_id == 0, "First repo ID should be 0");

        // Get the repository
        let repo = await Backend.get_repository(repo_id);

        switch (repo) {
            case (null) { Debug.trap("Repository not found after creation"); };
            case (?r) {
                assert(r.id == repo_id, "Repo ID mismatch");
                assert(r.name == "test-repo", "Repo name mismatch");
                assert(r.description == "A test repository", "Repo description mismatch");
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
        assert(bounty_id == 0, "First bounty ID should be 0");

        // Get the bounty
        let bounty = await Backend.get_bounty(bounty_id);

        switch (bounty) {
            case (null) { Debug.trap("Bounty not found after creation"); };
            case (?b) {
                assert(b.id == bounty_id, "Bounty ID mismatch");
                assert(b.repo_id == repo_id, "Bounty repo_id mismatch");
                assert(b.issue_id == issue_id, "Bounty issue_id mismatch");
                assert(b.amount == amount, "Bounty amount mismatch");
                assert(b.status == #Open, "Bounty status should be Open");
            };
        };

        Debug.print("--- Test passed: testCreateAndGetBounty ---");
    };
};
