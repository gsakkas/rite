
let rec sqsumL xs = match xs with | [] -> 0 | h::t -> (sqsumL t) @ (h * h);;
