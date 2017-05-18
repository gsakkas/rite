
let extract n (p1,p2) = match n with | 1 -> p1 | 2 -> p2 | _ -> (-1);;

let _ = extract ("bobby", 2);;
