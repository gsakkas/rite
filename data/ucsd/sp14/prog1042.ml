
let rec sumList (hd::tl) = match hd with | [] -> 0 | hd -> hd + (sumList tl);;
