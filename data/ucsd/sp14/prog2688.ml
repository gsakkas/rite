
let rec sqsumL xs = match xs with | [] -> 0 | h::t -> (h * h) + sqsumL;;
