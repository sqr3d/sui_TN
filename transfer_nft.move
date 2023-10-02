// Transfer NFT function
public fun transfer_nft(nft_id: u64, recipient: address): bool {
    let mut nft: &mut NFT;
    if borrow_global<NFT>(nft_id) {
        nft = copy(g);
        let sender = get_txn_sender();
        
        // Check if the sender is the current owner of the NFT
        if sender == nft.owner {
            nft.owner = recipient;
            move_to(nft, &mut Ctx.self_nfts);
            true
        } else {
            false // Sender is not the owner of the NFT
        }
    } else {
        false // NFT with the given ID does not exist
    }
}
