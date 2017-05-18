
let sumlist xs = match 1 with | [] -> 0 | h::t -> h + (sumlist t);;
