
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let l = (digitsOfInt (n / 10)) :: (n mod 10) in listReverse l);;
