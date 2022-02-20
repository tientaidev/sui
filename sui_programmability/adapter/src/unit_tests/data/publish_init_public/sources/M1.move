module Test::M1 {
    use FastX::ID::VersionedID;
    use FastX::TxContext::{Self, TxContext};
    use FastX::Transfer;

    struct Object has key, store {
        id: VersionedID,
        value: u64,
    }

    // public initializer - should not be executed
    public fun init(ctx: &mut TxContext) {
        let value = 42;
        let singleton = Object { id: TxContext::new_id(ctx), value };
        Transfer::transfer(singleton, TxContext::get_signer_address(ctx))
    }
}
