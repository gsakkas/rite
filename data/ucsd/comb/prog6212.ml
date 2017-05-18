
let rec sumOfDigits n = match n with | [] -> 0 | h::t -> h + (sumOfDigits t);;

let _ = sumOfDigits = 9876;;
