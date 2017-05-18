
let carry x y = (x * y) / 10;;

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t -> [(mulByDigit i t) + (carry h i)] @ [remainder i t]);;
