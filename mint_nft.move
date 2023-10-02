// Mint NFT function
public fun mint_nft(community_id: u64, recipient: address, metadata: vector<u8>): bool {
    let community: &mut Community;
    if borrow_global<Community>(community_id) {
        community = copy(g);
        let sender = get_txn_sender();
        
        // Check if the sender is the owner of the community
        if sender == community.owner {
            let nft_id = 1; // Generate a unique NFT ID (you should implement this logic)
            let new_nft = NFT {
                id: nft_id,
                metadata: metadata,
                owner: recipient,
                community_id: community_id,
            };
            
            // Transfer ownership of the NFT to the recipient
            move_to(new_nft, &mut Ctx.self_nfts);
            true
        } else {
            false // Only the owner can mint NFTs
        }
    } else {
        false // Community with the given ID does not exist
    }
}
