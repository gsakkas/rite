
let digitsOfInt n =
  let rec digOfIntHelper n l =
    match n > 0 with
    | false  -> []
    | true  ->
        (match n > 9 with
         | false  -> n :: l
         | true  -> digOfIntHelper (n / 10) ((n mod 10) :: l)) in
  digOfIntHelper n [];;

let additivePersistence n =
  let rec addPerHelper n l =
    match l with | [] -> 0 | a::[] -> n | h::t -> addPerHelper (n + 1) t in
  addPerHelper 0 digitsOfInt n;;
