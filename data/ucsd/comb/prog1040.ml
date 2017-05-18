
let rec sumList xs = match xs with | [] -> [] | hd::tl -> hd + (sumList tl);;
