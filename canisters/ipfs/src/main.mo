actor {
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # " from the ipfs_canister!";
  };
};
