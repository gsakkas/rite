
let f a x =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match x with
  | (z,y) ->
      (match a with
       | [] -> let sum = z + y in intlist sum
       | h::t -> let sum = (h + z) + y in (intlist sum) @ t);;

let _ = f [9; 2] [];;
