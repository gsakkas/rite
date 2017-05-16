
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let n2 = [n mod 10] @ ((digitsOfInt n) / 10) in listReverse n2);;
