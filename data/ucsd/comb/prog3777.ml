
let f a x =
  let rec intlist l = if l < 10 then [l] else (intlist (l / 10)) @ [l mod 10] in
  match x with
  | (z,y) ->
      (match a with
       | [] -> let sum = z + y in intlist sum
       | h::t -> let sum = (h + z) + y in (intlist sum) @ t);;

let _ = f [] (9; 2);;
