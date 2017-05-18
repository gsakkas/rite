
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let _ = sumList ['a'];;
