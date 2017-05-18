
let rec sum (x,y) = match x with | [] -> y | h::t -> sum (t, (y + h));;

let rec revexp (x,y) = match x with | [] -> y | h::t -> sum (t, (h ^ y));;
