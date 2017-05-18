
let rec sqsum xs = match xs with | [] -> [] | h::t -> (h * h) + (sqsum t);;
