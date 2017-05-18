
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (fun help  ->
       fun n  -> match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10));;
