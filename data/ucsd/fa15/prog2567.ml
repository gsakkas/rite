
let rec listReverse l = match l with | [] -> [] | h::t -> [h; listReverse t];;
