// Get NFTs in a community function
public fun get_community_nfts(community_id: u64): vector<NFT> {
    let community: &mut Community;
    if borrow_global<Community>(community_id) {
        community = copy(g);
        let mut community_nfts: vector<NFT> = empty<NFT>();
        
        // Iterate through all NFTs and filter those owned by the community
        for nft in Ctx.self_nfts.values() {
            if nft.community_id == community_id {
                push_back(&mut community_nfts, nft);
            }
        }
        
        community_nfts
    } else {
        empty<NFT>() // Community with the given ID does not exist
    }
}
