use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;

fn main(
    id: Field,
    r: Field,
    oldPath: [Field; 8], 

    oldRoot: pub Field,
    newRoot: pub Field,
    commitment: pub Field,
    index: Field,
) {
    let commitment_calc = pedersen_hash([id, r]);

    assert(commitment_calc == commitment);

    let default_empty_leaf = 0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63;
    let computed_new_root = compute_merkle_root(default_empty_leaf, index, oldPath);
    assert(computed_new_root == oldRoot);

    let new_old_root = compute_merkle_root(commitment, index, oldPath);
    assert(new_old_root == newRoot);

}