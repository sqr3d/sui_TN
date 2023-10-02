// ThreedCommunity.move - Smart contract for managing communities with token-gated access

import 0x1::Prelude;
import 0x2::Coin;

// Define the Community struct to represent a community
resource struct Community {
    id: u64;
    name: vector<u8>;
    owner: address;
    token_type: vector<u8>;
    token_amount_required: u64;
    members: vector<address>;
}

public fun create_community(
    name: vector<u8>,
    token_type: vector<u8>,
    token_amount_required: u64,
): u64 {
    let id = 1; // For simplicity, use a static ID
    let owner = get_txn_sender();
    let new_community = Community {
        id: id,
        name: name,
        owner: owner,
        token_type: token_type,
        token_amount_required: token_amount_required,
        members: empty<address>(),
    };
    move_to(new_community, &mut Ctx.self_communities);
    id
}

public fun join_community(community_id: u64): bool {
    let community: &mut Community;
    let sender = get_txn_sender();
    if borrow_global<Community>(community_id) {
        community = copy(g);
        if sender != community.owner {
            let token_balance = Coin::balance(sender, community.token_type);
            if token_balance >= community.token_amount_required {
                move_from(sender, &mut Coin.self, community.token_type, community.token_amount_required);
                push_back(&mut community.members, sender);
                move_to(community, &mut Ctx.self_communities);
                true
            } else {
                false // Insufficient tokens to join the community
            }
        } else {
            false // Community owner cannot join their own community
        }
    } else {
        false // Community with the given ID does not exist
    }
}
