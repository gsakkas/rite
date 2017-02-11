
let rec listReverse l = match l with | [] -> [] | h::t -> [(listReverse t) h];;
